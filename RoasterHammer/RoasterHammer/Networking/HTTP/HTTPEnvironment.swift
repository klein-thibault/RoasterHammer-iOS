//
//  HTTPEnvironment.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/28/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation

struct HTTPEnvironment {
    var name: String
    var baseURL: URL
}

extension HTTPEnvironment {
    var defaultHTTPHeaders: Headers {
        return [
            "Content-Type": "application/json; charset=utf-8"
        ]
    }

    func basicAuthHeaders(token: String) -> Headers {
        return [
            "Authorization": "Basic \(token)"
        ].combineWith(defaultHTTPHeaders)
    }

}
