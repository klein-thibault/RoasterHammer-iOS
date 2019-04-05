//
//  EditUnitViewController.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/24/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammerShared

final class EditUnitViewController: EditUnitLayoutViewController {
    var interactor: EditUnitViewOutput!
    private let selectedUnit: SelectedUnitResponse
    private lazy var uniqueModels: [SelectedModelResponse] = {
        return selectedUnit.models.unique { $0.model.name }
    }()
    private lazy var dataSource: [String: [SelectedModelResponse]] = {
        var result = [String: [SelectedModelResponse]]()
        for model in self.uniqueModels {
            result[model.model.name] = selectedUnit.models.filter { $0.model.name == model.model.name }
        }

        return result
    }()

    init(unit: SelectedUnitResponse) {
        self.selectedUnit = unit
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = selectedUnit.unit.name

        tableView.dataSource = self
        tableView.delegate = self

        tableView.reloadData()
    }
}

extension EditUnitViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.keys.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let key = Array(dataSource.keys)[section]
        return dataSource[key]?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SingleLabelTableViewCell = tableView.dequeueIdentifiableCell(for: indexPath)
        let key = Array(dataSource.keys)[indexPath.section]
        if let models = dataSource[key] {
            let model = models[indexPath.row]
            cell.setupWithText(model.model.name)
        }

        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionName = Array(dataSource.keys)[section]
        let frame = CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 44.0)
        let headerView = TableViewHeaderWithAddButton(frame: frame)
        headerView.setupWithTitle(sectionName, section: section, delegate: self)

        return headerView
    }
}

extension EditUnitViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
}

extension EditUnitViewController: EditUnitView {
    
}

extension EditUnitViewController: TableViewHeaderWithAddButtonDelegate {
    func tableViewHeaderAddButtonTapped(_ sender: UIButton, inSection section: Int) {
        let key = Array(dataSource.keys)[section]
        guard let selectedModel = dataSource[key]?.first else {
            print("Could not find the model associated with the add button")
            return
        }

        print("Add model named \"\(selectedModel.model.name)\" tapped in section: \(section)")
    }
}
