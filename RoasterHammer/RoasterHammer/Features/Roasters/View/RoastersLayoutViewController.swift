//
//  RoastersLayoutViewController.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

class RoastersLayoutViewController: BaseViewController {

    let tableView = UITableView(forAutoLayout: ())

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.registerCell(cellClass: RoasterTableViewCell.self)
        view.backgroundColor = UIColor.white
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
    }

}
