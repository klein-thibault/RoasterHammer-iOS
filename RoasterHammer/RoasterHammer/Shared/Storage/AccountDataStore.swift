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
    private let tokenStoringKey = "authToken"

    func storeAuthToken(token: String) -> Bool {
        guard let data = token.data(using: .utf8) else {
            return false
        }

        return store.store(data: data, key: tokenStoringKey)
    }

    func getAuthToken() -> String? {
        guard let authTokenData = store.get(forKey: tokenStoringKey) else {
            return nil
        }

        return String(data: authTokenData, encoding: .utf8)
    }
}
