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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SingleLabelTableViewCell = tableView.dequeueIdentifiableCell(for: indexPath)

        return cell
    }
}

extension ModelWeaponSelectionViewController: UITableViewDelegate {

}

extension ModelWeaponSelectionViewController: ModelWeaponSelectionView {

}
