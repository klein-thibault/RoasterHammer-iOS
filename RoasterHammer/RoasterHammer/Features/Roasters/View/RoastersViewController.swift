//
//  RoastersViewController.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammerShared

final class RoastersViewController: RoastersLayoutViewController {
    var interactor: RoastersViewOutput!
    var router: RoastersRouter!
    var roasters: [RoasterResponse] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Roasters"
        let accountButton = UIBarButtonItem(title: "Profile",
                                            style: .plain,
                                            target: self,
                                            action: #selector(accountButtonTapped(_:)))
        let addRoasterButton = UIBarButtonItem(barButtonSystemItem: .add,
                                               target: self,
                                               action: #selector(addRoasterButtonTapped(_:)))
        navigationItem.leftBarButtonItem = accountButton
        navigationItem.rightBarButtonItem = addRoasterButton

        tableView.delegate = self
        tableView.dataSource = self
        router.navigationController = navigationController
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        interactor.getRoasters()
    }

    @objc private func accountButtonTapped(_ sender: UIBarButtonItem) {
        interactor.accountButtonTapped()
    }

    @objc private func addRoasterButtonTapped(_ sender: UIBarButtonItem) {
        let alert = Alerter().informationalAlertWithTextField(title: "Create Roaster",
                                                              message: "Enter your roaster name",
                                                              textFieldPlaceholder: "Roaster name") { [weak self] (text) in
                                                                if let roasterName = text {
                                                                    self?.interactor.addRoasterButtonTappedWithName(roasterName)
                                                                }
        }
        present(alert, animated: true, completion: nil)
    }

}

extension RoastersViewController: RoastersView {
    func displayRoasters(roasters: [RoasterResponse]) {
        self.roasters = roasters
    }

    func didReceiveError(_ error: Error) {
        let alert = Alerter().informationalAlert(title: "Error", message: error.localizedDescription)
        present(alert, animated: true, completion: nil)
        self.roasters = []
    }

    func presentLoginView() {
        router.presentLoginView()
    }

    func presentAccountView() {
        router.presentAccountView()
    }
}

extension RoastersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return roasters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SingleLabelTableViewCell = tableView.dequeueIdentifiableCell(for: indexPath)
        cell.setupWithText(roasters[indexPath.row].name)
        return cell
    }

}

extension RoastersViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedRoaster = roasters[indexPath.row]
        router.presentRoasterView(roaster: selectedRoaster)
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
