//
//  ArmiesBaseViewController.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/4/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

class ArmiesLayoutViewController: BaseViewController {
    let tableView = UITableView(forAutoLayout: ())

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.registerCell(cellClass: SingleLabelTableViewCell.self)

        title = "Armies"
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
}
