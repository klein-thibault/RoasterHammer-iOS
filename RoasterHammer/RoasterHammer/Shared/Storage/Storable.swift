//
//  Storable.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/26/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation

protocol Storable {
    associatedtype T

    func store(data: T, key: String) -> Bool
    func get(forKey key: String) -> T?
    func remove(forKey key: String)

}
