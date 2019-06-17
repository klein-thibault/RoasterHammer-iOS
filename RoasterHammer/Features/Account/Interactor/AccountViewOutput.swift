//
//  AccountViewOutput.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/7/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation

protocol AccountViewOutput {
    func isUserLoggedIn() -> Bool
    func login(email: String, password: String)
    func createAccount(email: String, password: String)
    func logout()
}
