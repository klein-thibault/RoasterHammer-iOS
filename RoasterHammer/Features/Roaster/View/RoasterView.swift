//
//  RoasterView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/2/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammer_Shared

protocol RoasterView: class {
    func didReceiveRoaster(roaster: RoasterResponse)
    func didReceiveError(error: Error)
}
