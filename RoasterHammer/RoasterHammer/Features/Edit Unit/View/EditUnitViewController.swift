//
//  EditUnitViewController.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/24/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammerShared

final class EditUnitViewController: EditUnitLayoutViewController {
    var interactor: EditUnitViewOutput!
    private let unit: SelectedUnitResponse

    init(unit: SelectedUnitResponse) {
        self.unit = unit
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EditUnitViewController: EditUnitView {
    
}
