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

final class RoasterViewController: RoasterBaseViewController {
    var interactor: RoasterViewOutput!
    var router: RoasterRouter!
    private var roaster: RoasterResponse

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
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: SingleLabelTableViewCell = tableView.dequeueIdentifiableCell(for: indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let detachment = roaster.detachments[section]
        let view = UIView(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 20))
        view.backgroundColor = UIColor.gray
        let label = UILabel(frame: CGRect.init(x: 10, y: 0, width: tableView.frame.width, height: 20))
        label.text = "\(detachment.name) - \(detachment.commandPoints) CP"
        view.addSubview(label)
        return view
    }
}

extension RoasterViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20.0
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0
    }
}
