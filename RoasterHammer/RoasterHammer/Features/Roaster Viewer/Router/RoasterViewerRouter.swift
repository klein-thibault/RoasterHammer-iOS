//
//  RoasterViewerRouter.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 4/27/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

final class RoasterViewerRouter {
    weak var navigationController: UINavigationController?

    func dismiss() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
}
