//
//  RoasterPresenter.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/2/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammer_Shared

final class RoasterPresenter: RoasterInteractorOutput {
    weak var view: RoasterView!

    func didReceiveRoaster(roaster: RoasterResponse) {
        view.didReceiveRoaster(roaster: roaster)
    }

    func didReceiveError(error: Error) {
        view.didReceiveError(error: error)
    }
}
