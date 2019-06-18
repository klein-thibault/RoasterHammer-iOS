//
//  RoasterInteractor.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/2/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import RoasterHammer_Shared

final class RoasterInteractor: RoasterViewOutput, BindableObject {
    var presenter: RoasterInteractorOutput!
    private let roasterDataManager: RoasterDataManager
    private let unitDataManager: UnitDataManager
    var roaster: RoasterResponse {
        didSet {
            didChange.send(self)
        }
    }

    var didChange = PassthroughSubject<RoasterInteractor, Never>()

    init(roasterDataManager: RoasterDataManager,
         unitDataManager: UnitDataManager,
         roaster: RoasterResponse) {
        self.roasterDataManager = roasterDataManager
        self.unitDataManager = unitDataManager
        self.roaster = roaster
    }

    // MARK: - Public Functions

    func getRoasterDetails() {
        getRoasterById(roasterId: roaster.id)
    }

    func deleteUnit(_ unitId: Int,
                    fromDetachment detachmentId: Int,
                    fromRoaster roasterId: Int,
                    inUnitRole unitRoleId: Int) {
        unitDataManager.removeUnitFromDetachment(detachmentId: detachmentId,
                                                 unitRoleId: unitRoleId,
                                                 unitId: unitId) { [weak self] (detachment, error) in
                                                    if let error = error {
                                                        self?.presenter.didReceiveError(error: error)
                                                    } else {
                                                        self?.getRoasterById(roasterId: roasterId)
                                                    }
        }
    }

    func roasterDidReceiveDetachmentUpdate(detachment: DetachmentResponse) {
        getRoasterById(roasterId: roaster.id)
    }

    // MARK: - Private Functions

    private func getRoasterById(roasterId: Int) {
        roasterDataManager.getRoaster(byRoasterId: roasterId) { [weak self] (roaster, error) in
            if let roaster = roaster {
                self?.roaster = roaster
            }
        }
    }
}
