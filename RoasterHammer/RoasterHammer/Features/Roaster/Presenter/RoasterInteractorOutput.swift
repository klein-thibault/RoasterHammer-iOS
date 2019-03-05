//
//  RoasterInteractorOutput.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/2/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammerShared

protocol RoasterInteractorOutput {
    func didReceiveRoaster(roaster: RoasterResponse)
    func didReceiveError(error: Error)
}
