//
//  HTTPEnvironmentManager.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/25/17.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

protocol HTTPEnvironmentManager: class {
    var currentEnvironment: HTTPEnvironment { get set }
    var environments: [HTTPEnvironment] { get }
}
