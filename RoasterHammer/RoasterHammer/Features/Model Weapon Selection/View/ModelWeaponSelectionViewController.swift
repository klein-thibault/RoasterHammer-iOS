//
//  ModelWeaponSelectionViewController.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 4/22/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammerShared

final class ModelWeaponSelectionViewController: ModelWeaponSelectionLayoutViewController {
    var interactor: ModelWeaponSelectionViewOutput!
    private let selectedModel: SelectedModelResponse

    init(selectedModel: SelectedModelResponse) {
        self.selectedModel = selectedModel
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Select Weapons"

        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ModelWeaponSelectionViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return selectedModel.model.weaponBuckets.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let weaponBucket = selectedModel.model.weaponBuckets[section]
        return weaponBucket.weapons.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SingleLabelTableViewCell = tableView.dequeueIdentifiableCell(for: indexPath)
        let weaponBucket = selectedModel.model.weaponBuckets[indexPath.section]
        let weapon = weaponBucket.weapons[indexPath.row]

        cell.setupWithText(weapon.name)

        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionName = selectedModel.model.weaponBuckets[section].name
        let frame = CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 44.0)
        let headerView = TableViewHeaderLabel(frame: frame)

        headerView.setupWithTitle(sectionName)

        return headerView
    }
}

extension ModelWeaponSelectionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
}

extension ModelWeaponSelectionViewController: ModelWeaponSelectionView {

}
