//
//  RoasterViewController.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/2/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammerShared

typealias RoleIndex = [Int: RoleResponse]
typealias UnitIndex = [Int: SelectedUnitResponse]

final class RoasterViewController: RoasterLayoutViewController {
    var interactor: RoasterViewOutput!
    var router: RoasterRouter!
    private var roaster: RoasterResponse {
        didSet {
            emptyView.isHidden = self.roaster.detachments.count > 0
            tableView.reloadData()
        }
    }
    private var rolesIndex: RoleIndex = [:]
    private var unitsIndex: UnitIndex = [:]

    init(roaster: RoasterResponse) {
        self.roaster = roaster
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self

        router.navigationController = navigationController

        emptyView.isHidden = !roaster.detachments.isEmpty
        addDetachmentButton.addTarget(self, action: #selector(addDetachmentButtonTapped(_:)), for: .touchUpInside)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        interactor.getRoasterDetails(roasterId: roaster.id)
    }

    // MARK: - Private Functions

    @objc private func addDetachmentButtonTapped(_ sender: UIButton) {
        router.presentArmySelection(roaster: roaster)
    }

    /*
     [
     detachment: [
     HQ: [a, b],
     Troop: [c],
     Elite: []
     ]

     [HQ, a, b, Troop, c, Elite]
     [0: HQ, 3: Troop, 5: Elite]
     */
    private func rolesIndexes(fromDetachment detachment: DetachmentResponse) -> RoleIndex {
        var currentIndex = 0
        var result: RoleIndex = [:]
        for role in detachment.roles {
            result[currentIndex] = role
            currentIndex += role.units.count + 1
        }

        return result
    }

    /*
     [
     detachment: [
     HQ: [a, b],
     Troop: [c],
     Elite: []
     ]

     [HQ, a, b, Troop, c, Elite]
     [1: a, 2: b, 4: c]
     */
    private func unitsIndexes(fromDetachment detachment: DetachmentResponse) -> UnitIndex {
        var currentIndex = 0
        var result: UnitIndex = [:]
        for role in detachment.roles {
            currentIndex += 1
            for unit in role.units {
                result[currentIndex] = unit
                currentIndex += 1
            }
        }

        return result
    }

}

extension RoasterViewController: RoasterView {
    func didReceiveRoaster(roaster: RoasterResponse) {
        self.roaster = roaster
    }

    func didReceiveError(error: Error) {
        let alert = Alerter().informationalAlert(title: "Error", message: error.localizedDescription)
        present(alert, animated: true, completion: nil)
    }
}

extension RoasterViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return roaster.detachments.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let detachment = roaster.detachments[section]
        let unitsCount = detachment.roles.reduce(0) { $0 + $1.units.count }
        return detachment.roles.count + unitsCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let detachment = roaster.detachments[indexPath.section]
        let roleIndexes = rolesIndexes(fromDetachment: detachment)
        let unitIndexes = unitsIndexes(fromDetachment: detachment)

        if let role = roleIndexes[indexPath.row] {
            let cell: RoasterRoleTableViewCell = tableView.dequeueIdentifiableCell(for: indexPath)
            cell.setupWithText(role.name, indexPath: indexPath, delegate: self)
            cell.contentView.backgroundColor = UIColor.lightGray
            return cell
        } else if let unit = unitIndexes[indexPath.row] {
            let cell: RoasterUnitTableViewCell = tableView.dequeueIdentifiableCell(for: indexPath)
            cell.setupWithUnitName(unit.unit.name, indexPath: indexPath, delegate: self)
            return cell
        }

        assertionFailure("The proper cell could not be identified for index path \(indexPath)")
        return UITableViewCell(forAutoLayout: ())
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let detachment = roaster.detachments[section]
        let frame = CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 44.0)
        let headerView = TableViewHeaderLabel(frame: frame)
        let title = "\(detachment.name) - \(detachment.commandPoints) CP"

        headerView.setupWithTitle(title)

        return headerView
    }
}

extension RoasterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44.0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let detachment = roaster.detachments[indexPath.section]
        let roleIndexes = rolesIndexes(fromDetachment: detachment)
        var unitIndexes = unitsIndexes(fromDetachment: detachment)

        guard let unit = unitIndexes[indexPath.row],
            let role = roleIndexes.filter({ $0.value.units.contains(where: { $0.id == unit.id })}).first?.value else {
            return nil
        }

        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { [unowned self] (action, indexPath) in
            // TODO: after updating the data source, remove the unit locally before removing the row
            // tableView.deleteRows(at: [indexPath], with: .fade)
            self.interactor.deleteUnit(unit.id, fromDetachment: detachment.id, fromRoaster: self.roaster.id, inUnitRole: role.id)
        }

        return [delete]
    }
}

extension RoasterViewController: RoasterRoleTableViewCellDelegate {
    func roasterRoleTableViewCellDidTapAddButton(_ sender: UIButton, atIndexPath indexPath: IndexPath) {
        let detachment = roaster.detachments[indexPath.section]
        let roleIndexes = rolesIndexes(fromDetachment: detachment)
        if let role = roleIndexes[indexPath.row] {
            let filters = UnitFilters(armyId: String(detachment.army.id),
                                      unitType: role.name)
            router.presentUnitsView(filters: filters, detachmentId: detachment.id, unitRoleId: role.id)
        }
    }
}

extension RoasterViewController: RoasterUnitTableViewCellDelegate {
    func roasterUnitTableViewCellDidTapEditButton(_ sender: UIButton, atIndexPath indexPath: IndexPath) {
        let detachment = roaster.detachments[indexPath.section]
        let unitIndexes = unitsIndexes(fromDetachment: detachment)
        guard let unit = unitIndexes[indexPath.row] else {
            return
        }

        router.presentEditUnitView(detachment: detachment, unit: unit)
    }
}
