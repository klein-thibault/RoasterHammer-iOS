//
//  HTTPResponse.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/26/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation

public struct HTTPResponse {

    public let data: Any
    public let statusCode: Int?

    public init(data: Any, statusCode: Int?) {
        self.data = data
        self.statusCode = statusCode
    }

}
