//
//  RoasterViewerViewController.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 4/27/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammerShared

final class RoasterViewerViewController: RoasterViewerLayoutViewController {
    var interactor: RoasterViewerViewOutput!
    var router: RoasterViewerRouter!
    private let roaster: RoasterResponse

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

        let closeBarButtonItem = UIBarButtonItem(title: "Close",
                                                 style: .plain,
                                                 target: self,
                                                 action: #selector(closeBarButtonItemTapped(_:)))
        navigationItem.leftBarButtonItem = closeBarButtonItem
    }

    // MARK: - Private Functions

    @objc private func closeBarButtonItemTapped(_ sender: UIBarButtonItem) {
        router.dismiss()
    }

}

extension RoasterViewerViewController: RoasterViewerView {

}
