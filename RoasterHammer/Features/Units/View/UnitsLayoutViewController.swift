//
//  UnitsLayoutViewController.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/10/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

class UnitsLayoutViewController: BaseViewController {
    let tableView = UITableView(forAutoLayout: ())

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.registerCell(cellClass: SingleLabelTableViewCell.self)

        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
}
