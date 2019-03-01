//
//  BaseDataManager.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/1/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation

class BaseDataManager {
    let environmentManager: HTTPEnvironmentManager
    let httpClient: HTTPClient

    init(environmentManager: HTTPEnvironmentManager,
         httpClient: HTTPClient = AlamofireHTTPClient()) {
        self.environmentManager = environmentManager
        self.httpClient = httpClient
    }
}
