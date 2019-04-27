//
//  UICollectionView+IdentifiableView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 4/27/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    func dequeueIdentifiableCell<T: IdentifiableView>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("No collection view cell could be dequeued with identifier \(T.reuseIdentifier)")
        }

        return cell
    }

    func registerCell<T: IdentifiableView>(cellClass: T.Type) {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
}
