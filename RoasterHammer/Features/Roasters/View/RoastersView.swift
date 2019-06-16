//
//  RoastersView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammer_Shared

protocol RoastersView: class {
    func presentLoginView()
    func presentAccountView()
    func displayRoasters(roasters: [RoasterResponse])
    func didReceiveError(_ error: Error)
}
