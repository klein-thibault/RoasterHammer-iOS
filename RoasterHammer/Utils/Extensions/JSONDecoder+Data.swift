//
//  JSONDecoder.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 2/25/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation

extension JSONDecoder {

    func decodeResponse<T: Decodable>(from data: Data) throws -> T {
        return try decode(T.self, from: data)
    }

    func decodeResponseArray<T: Decodable>(from data: Data) throws -> [T] {
        return try decode([T].self, from: data)
    }

}
