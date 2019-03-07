//
//  RoastersInteractorOutput.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammerShared

protocol RoastersInteractorOutput {
    func shouldPresentLoginView()
    func shouldPresentAccountView()
    func didReceiveRoasters(roasters: [RoasterResponse])
    func didReceiveError(_ error: Error)
}
