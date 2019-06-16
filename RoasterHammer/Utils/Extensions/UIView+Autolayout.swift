//
//  UIView+Autolayout.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/25/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

    convenience init(forAutoLayout: ()) {
        self.init()
        translatesAutoresizingMaskIntoConstraints = false
    }

}
