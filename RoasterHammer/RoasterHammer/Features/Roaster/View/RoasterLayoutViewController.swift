//
//  RoasterBaseViewController.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/2/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

class RoasterLayoutViewController: BaseViewController {
    let emptyView = UIView(forAutoLayout: ())
    let addDetachmentButton = UIButton(forAutoLayout: ())
    let tableView = UITableView(forAutoLayout: ())

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white

        emptyView.backgroundColor = UIColor.white
        addDetachmentButton.setTitle("Add Detachment", for: .normal)
        addDetachmentButton.setTitleColor(UIColor.black, for: .normal)
        tableView.registerCell(cellClass: SingleLabelTableViewCell.self)
        tableView.registerCell(cellClass: RoasterRoleTableViewCell.self)

        view.addSubview(tableView)
        view.addSubview(emptyView)
        emptyView.addSubview(addDetachmentButton)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            emptyView.topAnchor.constraint(equalTo: view.topAnchor),
            emptyView.leftAnchor.constraint(equalTo: view.leftAnchor),
            emptyView.rightAnchor.constraint(equalTo: view.rightAnchor),
            emptyView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            addDetachmentButton.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor),
            addDetachmentButton.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor)
            ])
    }

}
