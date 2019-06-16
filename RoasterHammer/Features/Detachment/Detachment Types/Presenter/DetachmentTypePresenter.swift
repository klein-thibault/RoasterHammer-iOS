//
//  DetachmentTypePresenter.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/4/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammer_Shared

final class DetachmentTypePresenter: DetachmentTypeInteractorOutput {
    weak var view: DetachmentTypeView!

    func didReceiveError(error: Error) {
        view.didReceiveError(error: error)
    }

    func didReceiveDetachmentTypes(detachmentTypes: [DetachmentShortResponse]) {
        view.displayDetachmentTypes(detachmentTypes: detachmentTypes)
    }

    func didCreateNewDetachmentInRoaster(roaster: RoasterResponse) {
        view.showUpdatedRoaster(roaster: roaster)
    }
}
