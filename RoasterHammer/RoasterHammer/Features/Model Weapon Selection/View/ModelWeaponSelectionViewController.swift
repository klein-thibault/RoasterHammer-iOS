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
    private var selectedModel: SelectedModelResponse {
        didSet {
            tableView.reloadData()
        }
    }
    private let detachment: DetachmentResponse

    init(detachment: DetachmentResponse, selectedModel: SelectedModelResponse) {
        self.detachment = detachment
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

    fileprivate func isWeaponSelected(weapon: WeaponResponse) -> Bool {
        let selectedWeapons = selectedModel.selectedWeapons
        return selectedWeapons.contains(weapon)
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
        let shouldShowCheckmark = isWeaponSelected(weapon: weapon)

        cell.setupWithText(weapon.name)
        cell.accessoryType = shouldShowCheckmark ? .checkmark : .none

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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let weaponBucket = selectedModel.model.weaponBuckets[indexPath.section]
        let weapon = weaponBucket.weapons[indexPath.row]

        let shouldAttachWeapon = !isWeaponSelected(weapon: weapon)

        if shouldAttachWeapon {
            interactor.attachWeaponToSelectedModel(weapon.id,
                                                   fromWeaponBucket: weaponBucket.id,
                                                   forModel: selectedModel.id,
                                                   inDetachment: detachment.id)
        } else {
            interactor.detachWeaponFromSelectedModel(weapon.id,
                                                     fromWeaponBucket: weaponBucket.id,
                                                     forModel: selectedModel.id,
                                                     inDetachment: detachment.id)
        }

        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ModelWeaponSelectionViewController: ModelWeaponSelectionView {
    func didReceiveSelectedUnit(unit: SelectedUnitResponse) {
        if let updatedSelectedModel = unit.models.first(where: { $0.id == selectedModel.id }) {
            self.selectedModel = updatedSelectedModel
        }
    }

    func didReceiveError(error: Error) {
        let alert = Alerter().informationalAlert(title: "Error", message: error.localizedDescription)
        present(alert, animated: true, completion: nil)
    }
}
