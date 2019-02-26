//
//  JSONConvertible.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/25/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation

typealias JSON = [String: Any]

protocol JSONConvertible {

    func toJSON() -> JSON
    
}
