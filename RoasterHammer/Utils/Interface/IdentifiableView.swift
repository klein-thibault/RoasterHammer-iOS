//
//  IdentifiableView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

protocol IdentifiableView: class {
    static var reuseIdentifier: String { get }
}

extension IdentifiableView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: IdentifiableView { }
extension UICollectionViewCell: IdentifiableView { }
