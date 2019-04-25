//
//  RoasterDetachmentUpdateDelegate.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 4/24/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammerShared

protocol RoasterDetachmentUpdateDelegate: class {
    func roasterDidReceiveDetachmentUpdate(detachment: DetachmentResponse)
}

