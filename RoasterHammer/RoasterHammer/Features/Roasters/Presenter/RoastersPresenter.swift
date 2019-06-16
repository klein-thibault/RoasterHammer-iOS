//
//  RoastersPresenter.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammer_Shared

final class RoastersPresenter: RoastersInteractorOutput {
    weak var view: RoastersView!

    func shouldPresentLoginView() {
        view.presentLoginView()
    }

    func shouldPresentAccountView() {
        view.presentAccountView()
    }

    func didReceiveRoasters(roasters: [RoasterResponse]) {
        view.displayRoasters(roasters: roasters)
    }

    func didReceiveError(_ error: Error) {
        view.didReceiveError(error)
    }
}
