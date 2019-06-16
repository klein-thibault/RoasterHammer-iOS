//
//  QueryItemConvertible.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/10/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation

protocol QueryItemConvertible {
    func toQueryItems() -> QueryItems?
}
