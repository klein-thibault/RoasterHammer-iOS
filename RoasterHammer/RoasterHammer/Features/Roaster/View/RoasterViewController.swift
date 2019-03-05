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
    let roaster: RoasterResponse
    var interactor: RoasterViewOutput!
    var router: RoasterRouter!

    init(roaster: RoasterResponse) {
        self.roaster = roaster
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

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
        print(roaster)
    }

    func didReceiveError(error: Error) {
        let alert = Alerter().informationalAlert(title: "Error", message: error.localizedDescription)
        present(alert, animated: true, completion: nil)
    }
}
