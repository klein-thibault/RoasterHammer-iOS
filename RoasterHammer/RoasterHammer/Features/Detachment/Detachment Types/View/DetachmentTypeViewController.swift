//
//  DetachmentTypeViewController.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/4/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammerShared

final class DetachmentTypeViewController: DetachmentTypeBaseViewController {
    let roaster: RoasterResponse
    var interactor: DetachmentTypeViewOutput!

    init(roaster: RoasterResponse) {
        self.roaster = roaster
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetachmentTypeViewController: DetachmentTypeView {

}
