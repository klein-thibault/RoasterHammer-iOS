//
//  RoasterInteractor.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/2/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation

final class RoasterInteractor: RoasterViewOutput {
    var presenter: RoasterInteractorOutput!
    let roasterDataManager: RoasterDataManager

    init(roasterDataManager: RoasterDataManager) {
        self.roasterDataManager = roasterDataManager
    }

    func getRoasterDetails(roasterId: Int) {
        roasterDataManager.getRoaster(byRoasterId: roasterId) { [weak self] (roaster, error) in
            if let error = error {
                self?.presenter.didReceiveError(error: error)
            } else if let roaster = roaster {
                self?.presenter.didReceiveRoaster(roaster: roaster)
            }
        }
    }
}
