//
//  EditUnitRouter.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 4/22/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit
import RoasterHammerShared

final class EditUnitRouter {
    private unowned var dependencyManager: DependencyManager
    weak var navigationController: UINavigationController?

    init(dependencyManager: DependencyManager) {
        self.dependencyManager = dependencyManager
    }

    func presentModelWeaponSelection(detachment: DetachmentResponse,
                                     selectedModel: SelectedModelResponse,
                                     delegate: ModelWeaponSelectionInteractorDelegate?) {
        let modelWeaponSelectionView = dependencyManager.modelWeaponSelectionBuilder().build(detachment: detachment,
                                                                                             selectedModel: selectedModel,
                                                                                             delegate: delegate)

        navigationController?.pushViewController(modelWeaponSelectionView, animated: true)
    }
}
