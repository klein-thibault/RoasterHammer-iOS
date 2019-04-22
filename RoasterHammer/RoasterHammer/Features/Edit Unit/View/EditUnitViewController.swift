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

typealias ModelsIndex = [Int: [SelectedModelResponse]]

final class EditUnitViewController: EditUnitLayoutViewController {
    var interactor: EditUnitViewOutput!
    var router: EditUnitRouter!
    private let detachment: DetachmentResponse
    private var selectedUnit: SelectedUnitResponse {
        didSet {
            tableView.reloadData()
        }
    }
    private var uniqueModels: [SelectedModelResponse] {
        return selectedUnit.models.unique { $0.model.name }
    }
    private var dataSource: ModelsIndex {
        return modelsIndex(fromSelectedUnit: selectedUnit)
    }

    init(detachment: DetachmentResponse, unit: SelectedUnitResponse) {
        self.detachment = detachment
        self.selectedUnit = unit
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = selectedUnit.unit.name

        router.navigationController = navigationController

        tableView.dataSource = self
        tableView.delegate = self

        tableView.reloadData()
    }

    private func modelsIndex(fromSelectedUnit unit: SelectedUnitResponse) -> ModelsIndex {
        var result: ModelsIndex = [:]
        for (index, uniqueModel) in uniqueModels.enumerated() {
            result[index] = selectedUnit.models.filter { $0.model.name == uniqueModel.model.name }
        }

        return result
    }
}

extension EditUnitViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.keys.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource[section]?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SingleLabelWithActionButtonTableViewCell = tableView.dequeueIdentifiableCell(for: indexPath)
        if let models = dataSource[indexPath.section] {
            let model = models[indexPath.row]
            cell.setupWithTitle(model.model.name, actionButtonTitle: "Select Weapons", indexPath: indexPath, delegate: self)
        }

        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let sectionName = dataSource[section]?.first?.model.name else {
            return nil
        }

        let frame = CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 44.0)
        let headerView = TableViewHeaderLabelWithAddButton(frame: frame)
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

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        guard let models = dataSource[indexPath.section] else {
            return nil
        }

        let model = models[indexPath.row]

        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { [unowned self] (action, indexPath) in
            self.interactor.removeModel(model.id,
                                        fromUnit: self.selectedUnit.id,
                                        inDetachment: self.detachment.id)
        }

        return [delete]
    }
}

extension EditUnitViewController: EditUnitView {
    func didReceiveSelectedUnit(unit: SelectedUnitResponse) {
        self.selectedUnit = unit
    }

    func didReceiveError(error: Error) {
        let alert = Alerter().informationalAlert(title: "Error", message: error.localizedDescription)
        present(alert, animated: true, completion: nil)
    }
}

extension EditUnitViewController: TableViewHeaderLabelWithAddButtonDelegate {
    func tableViewHeaderAddButtonTapped(_ sender: UIButton, inSection section: Int) {
        guard let selectedModel = dataSource[section]?.first else {
            print("Could not find the model associated with the add button")
            return
        }

        interactor.addModel(selectedModel.model.id, toUnit: selectedUnit.id, inDetachment: detachment.id)
    }
}

extension EditUnitViewController: SingleLabelWithActionButtonTableViewCellDelegate {
    func singleLabelCellActionButtonTapped(_ sender: UIButton, atIndexPath indexPath: IndexPath) {
        if let models = dataSource[indexPath.section] {
            let model = models[indexPath.row]
            router.presentModelWeaponSelection(selectedModel: model)
        }
    }
}
