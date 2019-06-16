//
//  UnitsViewController.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/10/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammer_Shared

final class UnitsViewController: UnitsLayoutViewController {
    var interactor: UnitsViewOutput!
    var router: UnitsRouter!

    private var units: [UnitResponse] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Units"

        let closeButton = UIBarButtonItem(title: "Close",
                                          style: .plain,
                                          target: self,
                                          action: #selector(closeButtonTapped(_:)))
        navigationItem.rightBarButtonItem = closeButton

        router.navigationController = navigationController

        tableView.dataSource = self
        tableView.delegate = self

        interactor.getUnits()
    }

    @objc private func closeButtonTapped(_ sender: UIBarButtonItem) {
        router.dismiss()
    }
}

extension UnitsViewController: UnitsView {
    func didReceiveUnits(_ units: [UnitResponse]) {
        self.units = units
    }

    func didUpdateDetachment(_ detachment: DetachmentResponse) {
        router.dismiss()
    }

    func didReceiveError(_ error: Error) {
        let alert = Alerter().informationalAlert(title: "Error", message: error.localizedDescription)
        present(alert, animated: true, completion: nil)
        self.units = []
    }
}

extension UnitsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return units.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SingleLabelTableViewCell = tableView.dequeueIdentifiableCell(for: indexPath)
        let unit = units[indexPath.row]

        cell.setupWithText(unit.name)

        return cell
    }
}

extension UnitsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let unit = units[indexPath.row]
        interactor.addUnitToDetachment(unitId: unit.id, quantity: 1)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
