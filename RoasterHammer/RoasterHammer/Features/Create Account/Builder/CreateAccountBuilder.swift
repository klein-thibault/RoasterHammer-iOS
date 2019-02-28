//
//  CreateAccountBuilder.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

protocol CreateAccountBuildable {
    func build() -> UIViewController
}

final class CreateAccountBuilder: CreateAccountBuildable {
    func build() -> UIViewController {
        let dataManager = AccountDataManager()
        let interactor = CreateAccountInteractor(dataManager: dataManager)
        let presenter = CreateAccountPresenter()
        let view = CreateAccountViewController()

        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view

        return view
    }
}
