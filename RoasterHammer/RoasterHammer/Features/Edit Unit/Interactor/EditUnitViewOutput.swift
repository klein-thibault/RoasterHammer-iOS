//
//  EditUnitViewOutput.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/24/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation

protocol EditUnitViewOutput {
    func addModel(_ modelId: Int, toUnit unitId: Int, inDetachment detachmentId: Int)
}
