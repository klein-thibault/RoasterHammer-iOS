//
//  UITableView+IdentifiableView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func dequeueIdentifiableCell<T: IdentifiableView>() -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("No table view cell could be dequeued with identifier \(T.reuseIdentifier)")
        }

        return cell
    }

    func dequeueIdentifiableCell<T: IdentifiableView>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("No table view cell could be dequeued with identifier \(T.reuseIdentifier)")
        }

        return cell
    }

    func registerCell<T: IdentifiableView>(cellClass: T.Type) {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
}
