//
//  LoginPresenter.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation

final class LoginPresenter: LoginInteractorOutput {
    weak var view: LoginView!

    func didLogin() {
        view.didLogin()
    }

    func didReceiveError(_ error: Error) {
        view.didReceiveError(error)
    }
}
