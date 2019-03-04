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

final class RoasterViewController: RoasterBaseViewController, RoasterView {
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

    // MARK: - Private Functions

    @objc private func addDetachmentButtonTapped(_ sender: UIButton) {
        router.presentArmySelection(roaster: roaster)
    }

}
