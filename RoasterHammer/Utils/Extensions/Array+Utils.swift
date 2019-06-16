//
//  Array+Utils.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 3/26/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import Foundation

extension Array {
    func unique<T: Hashable>(map: ((Element) -> (T))) -> [Element] {
        var set = Set<T>()
        var result = [Element]()

        for element in self {
            if !set.contains(map(element)) {
                set.insert(map(element))
                result.append(element)
            }
        }

        return result
    }
}

extension Sequence where Element: Equatable {
    func commonElements(in array: [Element]) -> [Element] {
        return self.filter { array.contains($0) }
    }
}
