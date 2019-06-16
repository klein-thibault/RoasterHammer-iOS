//
//  HTTPEnvironmentManager.swift
//  PCFSwift
//
//  Created by Thibault Klein on 2/25/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

protocol HTTPEnvironmentManager: class {
    var currentEnvironment: HTTPEnvironment { get set }
    var environments: [HTTPEnvironment] { get }
}
