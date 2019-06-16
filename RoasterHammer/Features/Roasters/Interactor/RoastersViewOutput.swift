//
//  RoastersViewOutput.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation

protocol RoastersViewOutput {
    func getRoasters()
    func accountButtonTapped()
    func addRoasterButtonTappedWithName(_ name: String)
}
