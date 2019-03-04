//
//  DetachmentTypeInteractor.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/4/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation

final class DetachmentTypeInteractor: DetachmentTypeViewOutput {
    var presenter: DetachmentTypeInteractorOutput!
    private let detachmentDataManager: DetachmentDataManager

    init(detachmentDataManager: DetachmentDataManager) {
        self.detachmentDataManager = detachmentDataManager
    }

    func getDetachmentTypes() {
        detachmentDataManager.getDetachmentTypes { [weak self] (detachmentTypes, error) in
            if let error = error {
                self?.presenter.didReceiveError(error: error)
            } else if let detachmentTypes = detachmentTypes {
                self?.presenter.didReceiveDetachmentTypes(detachmentTypes: detachmentTypes)
            }
        }
    }
}
