//
//  CreateAccountViewOutput.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation

protocol CreateAccountViewOutput {
    func createAccount(email: String, password: String)
}
