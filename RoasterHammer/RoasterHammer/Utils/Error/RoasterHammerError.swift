//
//  RoasterHammerError.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/1/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation

enum RoasterHammerError: Error {
    case userNotLoggedIn
}

extension RoasterHammerError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .userNotLoggedIn:
            return "Auth token could not be found"
        }
    }

    var localizedDescription: String {
        switch self {
        case .userNotLoggedIn:
            return "You need to be logged in first"
        }
    }
}
