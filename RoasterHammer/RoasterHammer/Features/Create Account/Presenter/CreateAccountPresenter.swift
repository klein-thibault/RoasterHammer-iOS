//
//  CreateAccountPresenter.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation

final class CreateAccountPresenter: CreateAccountInteractorOutput {
    var view: CreateAccountView!

    func didRegister() {
        view.didRegister()
    }

    func didReceiveError(_ error: Error) {
        view.didReceiveError(error)
    }
}
