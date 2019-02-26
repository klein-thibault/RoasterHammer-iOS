//
//  AccountDataManager.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/26/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammerShared

final class AccountDataManager {
    private let networking = AccountNetworking()
    private let accountStore = AccountDataStore()

    func createAccount(email: String, password: String, completion: @escaping (UserResponse?, Error?) -> Void) {
        let request = CreateUserRequest(email: email, password: password)
        networking.createAccount(request: request) { (response, error) in
            guard let data = response?.data else {
                completion(nil, JSONDecodingError.invalidDataType)
                return
            }

            do {
                let user: UserResponse = try JSONDecoder().decodeResponse(from: data)
                completion(user, nil)
            } catch {
                completion(nil, error)
            }
        }
    }

    func login(email: String, password: String, completion: @escaping (String?, Error?) -> Void) {
        let basicToken = "\(email):\(password)".toBase64()
        networking.login(basicToken: basicToken) { [weak self] (response, error) in
            guard let data = response?.data else {
                completion(nil, JSONDecodingError.invalidDataType)
                return
            }

            do {
                let user: AuthTokenResponse = try JSONDecoder().decodeResponse(from: data)
                let tokenStoreResult = self?.accountStore.storeAuthToken(token: user.token) ?? false
                if !tokenStoreResult {
                    // Couldn't store the user's auth token
                }

                completion(user.token, nil)
            } catch {
                completion(nil, error)
            }
        }
    }
}
