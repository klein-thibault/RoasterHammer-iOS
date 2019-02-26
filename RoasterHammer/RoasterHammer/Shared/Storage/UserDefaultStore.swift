//
//  UserDefaultStore.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/26/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation

final class UserDefaultStore: Storable {
    typealias T = Data

    func store(data: T, key: String) -> Bool {
        UserDefaults.standard.set(data, forKey: key)
        return true
    }

    func get(forKey key: String) -> T? {
        return UserDefaults.standard.data(forKey: key)
    }

}
