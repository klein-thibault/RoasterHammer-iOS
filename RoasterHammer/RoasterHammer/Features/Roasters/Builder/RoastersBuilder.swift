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

final class RoastersBuilder: RoastersBuildable {
    func build() -> UIViewController {
        let view = RoastersViewController()

        return view
    }
}
