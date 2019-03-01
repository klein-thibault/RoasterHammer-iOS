//
//  RoastersBuilder.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

protocol RoastersBuildable {
    func build() -> UIViewController
}

final class RoastersBuilder: FeatureBuilderBase, RoastersBuildable {
    func build() -> UIViewController {
        let environmentManager = dependencyManager.environmentManager
        let dataManager = AccountDataManager(environmentManager: environmentManager)
        let interactor = RoastersInteractor(accountDataManager: dataManager)
        let presenter = RoastersPresenter()
        let view = RoastersViewController()

        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view

        return view
    }
}
