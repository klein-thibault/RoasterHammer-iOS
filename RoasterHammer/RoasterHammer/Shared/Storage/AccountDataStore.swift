//
//  AccountDataStore.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/26/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation

final class AccountDataStore {
    private let store = UserDefaultStore()

    func storeAuthToken(token: String) -> Bool {
        guard let data = token.data(using: .utf8) else {
            return false
        }

        return store.store(data: data, key: "authToken")
    }
}
