//
//  RoasterBaseViewController.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/2/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

class RoasterBaseViewController: BaseViewController {
    let emptyView = UIView(forAutoLayout: ())
    let addDetachmentButton = UIButton(forAutoLayout: ())

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white

        addDetachmentButton.setTitle("Add Detachment", for: .normal)
        addDetachmentButton.setTitleColor(UIColor.black, for: .normal)

        view.addSubview(emptyView)
        emptyView.addSubview(addDetachmentButton)

        NSLayoutConstraint.activate([
            emptyView.topAnchor.constraint(equalTo: view.topAnchor),
            emptyView.leftAnchor.constraint(equalTo: view.leftAnchor),
            emptyView.rightAnchor.constraint(equalTo: view.rightAnchor),
            emptyView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            addDetachmentButton.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor),
            addDetachmentButton.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor)
            ])
    }

}
