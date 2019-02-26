//
//  CreateAccountDataManager.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/26/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation
import RoasterHammerShared

final class CreateAccountDataManager {
    private let networking = AccountNetworking()

    func createAccount(email: String, password: String, completion: @escaping (UserResponse?, Error?) -> Void) {
        let request = CreateUserRequest(email: email, password: password)
        networking.createAccount(request: request) { (response, error) in
            if let data = response?.data as? Data {
                do {
                    let jsonDecoder = JSONDecoder<UserResponse>()
                    let user = try jsonDecoder.decode(data: data)
                    completion(user, nil)
                } catch {
                    completion(nil, error)
                }
            }
        }
    }
}
