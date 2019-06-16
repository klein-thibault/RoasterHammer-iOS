//
//  UnitsView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/10/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammer_Shared

protocol UnitsView: class {
    func didReceiveUnits(_ units: [UnitResponse])
    func didUpdateDetachment(_ detachment: DetachmentResponse)
    func didReceiveError(_ error: Error)
}
