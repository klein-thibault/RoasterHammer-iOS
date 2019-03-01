//
//  JSONDecodingError.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/26/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation

enum JSONDecodingError: Error {
    case invalidDataType
}

extension JSONDecodingError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .invalidDataType:
            return "Received unexpected data for decoding JSON"
        }
    }

    var localizedDescription: String {
        switch self {
        case .invalidDataType:
            return "Something happened, please try again"
        }
    }
}
