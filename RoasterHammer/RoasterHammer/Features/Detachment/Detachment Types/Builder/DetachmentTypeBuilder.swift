//
//  DetachmentTypeBuilder.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/4/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammerShared

protocol DetachmentTypeBuildable {
    func build(roaster: RoasterResponse) -> UIViewController
}

final class DetachmentTypeBuilder: FeatureBuilderBase, DetachmentTypeBuildable {
    func build(roaster: RoasterResponse) -> UIViewController {
        let interactor = DetachmentTypeInteractor()
        let presenter = DetachmentTypePresenter()
        let view = DetachmentTypeViewController(roaster: roaster)

        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view

        return view
    }
}
