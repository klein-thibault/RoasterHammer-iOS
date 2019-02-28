//
//  LoginBuilder.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

protocol LoginBuildable {
    func build() -> UIViewController
}

final class LoginBuilder: LoginBuildable {
    func build() -> UIViewController {
        let dataManager = AccountDataManager()
        let interactor = LoginInteractor(dataManager: dataManager)
        let presenter = LoginPresenter()
        let view = LoginViewController()

        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view

        return view
    }
}
