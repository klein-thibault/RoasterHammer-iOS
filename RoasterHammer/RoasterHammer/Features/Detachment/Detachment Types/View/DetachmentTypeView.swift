//
//  DetachmentTypeView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/4/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammerShared

protocol DetachmentTypeView: class {
    func displayDetachmentTypes(detachmentTypes: [DetachmentShortResponse])
    func didReceiveError(error: Error)
}
