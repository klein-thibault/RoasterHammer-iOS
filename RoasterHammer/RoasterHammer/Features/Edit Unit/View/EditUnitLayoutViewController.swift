//
//  EditUnitLayoutViewController.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/24/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

class EditUnitLayoutViewController: BaseViewController {
    let tableView = UITableView(forAutoLayout: ())

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        tableView.registerCell(cellClass: SingleLabelTableViewCell.self)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    
}
