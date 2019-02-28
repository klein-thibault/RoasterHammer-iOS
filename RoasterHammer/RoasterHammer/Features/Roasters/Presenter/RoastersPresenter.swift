//
//  RoastersPresenter.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation

final class RoastersPresenter: RoastersInteractorOutput {
    weak var view: RoastersView!

    func shouldPresentLoginView() {
        view.presentLoginView()
    }
}
