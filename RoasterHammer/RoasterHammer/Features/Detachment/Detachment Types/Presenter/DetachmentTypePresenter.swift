//
//  DetachmentTypePresenter.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/4/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammerShared

final class DetachmentTypePresenter: DetachmentTypeInteractorOutput {
    weak var view: DetachmentTypeView!

    func didReceiveError(_ error: Error) {
        view.didReceiveError(error)
    }

    func didReceiveDetachmentTypes(_ detachmentTypes: [DetachmentShortResponse]) {
        view.displayDetachmentTypes(detachmentTypes: detachmentTypes)
    }
}
