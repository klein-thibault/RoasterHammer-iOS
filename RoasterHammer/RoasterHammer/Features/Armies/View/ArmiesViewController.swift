//
//  ArmiesViewController.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/4/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammerShared

final class ArmiesViewController: ArmiesLayoutViewController {
    var interactor: ArmiesViewOutput!
    var router: ArmiesRouter!
    let roaster: RoasterResponse
    var armies: [ArmyResponse] = []
    private let isPresentedModally: Bool

    init(roaster: RoasterResponse, isPresentedModally: Bool = false) {
        self.roaster = roaster
        self.isPresentedModally = isPresentedModally
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if isPresentedModally {
            let closeButton = UIBarButtonItem(title: "Cancel",
                                              style: .plain,
                                              target: self,
                                              action: #selector(closeButtonTapped(_:)))
            navigationItem.rightBarButtonItem = closeButton
        }

        router.navigationController = navigationController

        tableView.dataSource = self
        tableView.delegate = self

        interactor.getArmies()
    }

    @objc private func closeButtonTapped(_ sender: UIButton) {
        router.dismiss()
    }
}

extension ArmiesViewController: ArmiesView {
    func didReceiveArmies(armies: [ArmyResponse]) {
        self.armies = armies
        tableView.reloadData()
    }

    func didReceiveError(error: Error) {
        let alert = Alerter().informationalAlert(title: "Error", message: error.localizedDescription)
        present(alert, animated: true, completion: nil)
    }
}

extension ArmiesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return armies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SingleLabelTableViewCell = tableView.dequeueIdentifiableCell(for: indexPath)
        let army = armies[indexPath.row]

        cell.setupWithText(army.name)

        return cell
    }


}

extension ArmiesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedArmy = armies[indexPath.row]
        router.presentDetachmentTypesView(armyId: selectedArmy.id, roaster: roaster)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
