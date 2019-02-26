//
//  JSONDecoder.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/25/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation

final class JSONDecoder<T> where T: Codable {
    func encode(object: T) throws -> String? {
        let jsonEncoder = JSONEncoder()
        let jsonData = try jsonEncoder.encode(object)
        return String(data: jsonData, encoding: String.Encoding.utf8)
    }

    func decode(data: Data) throws -> T? {
        let jsonDecoder = JSONDecoder()
        return try jsonDecoder.decode(data: data)
    }
}
