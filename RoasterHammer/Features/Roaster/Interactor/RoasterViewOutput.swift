//
//  RoasterViewOutput.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/2/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation

protocol RoasterViewOutput: RoasterDetachmentUpdateDelegate {
    func getRoasterDetails()
    func deleteUnit(_ unitId: Int,
                    fromDetachment detachmentId: Int,
                    fromRoaster roasterId: Int,
                    inUnitRole unitRoleId: Int)
}
