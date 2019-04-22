//
//  ModelWeaponSelectionViewOutput.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 4/22/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation

protocol ModelWeaponSelectionViewOutput {
    func attachWeaponToSelectedModel(_ weaponId: Int,
                                     fromWeaponBucket weaponBucketId: Int,
                                     forModel modelId: Int,
                                     inDetachment detachmentId: Int)
}
