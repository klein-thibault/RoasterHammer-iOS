//
//  AccountDataManager.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/26/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammer_Shared

extension CreateUserRequest: JSONConvertible {
    func toJSON() -> JSON {
        return ["email": email, "password": password]
    }
}

final class AccountDataManager: BaseDataManager {
    private let accountStore = AccountDataStore()

    func isUserLoggedIn() -> Bool {
        return accountStore.getAuthToken() != nil
    }

    func createAccount(email: String, password: String, completion: @escaping (UserResponse?, Error?) -> Void) {
        let body = CreateUserRequest(email: email, password: password).toJSON()
        let request = HTTPRequest(method: .post,
                                  baseURL: environmentManager.currentEnvironment.baseURL,
                                  path: "/users/register",
                                  queryItems: nil,
                                  body: body,
                                  headers: environmentManager.currentEnvironment.defaultHTTPHeaders)

        httpClient.perform(request: request) { (response, error) in
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
        let request = HTTPRequest(method: .post,
                                  baseURL: environmentManager.currentEnvironment.baseURL,
                                  path: "/users/login",
                                  queryItems: nil,
                                  body: nil,
                                  headers: environmentManager.currentEnvironment.basicAuthHeaders(token: basicToken))

        httpClient.perform(request: request) { [weak self] (response, error) in
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

    func logout() {
        accountStore.deleteAuthToken()
    }
}
