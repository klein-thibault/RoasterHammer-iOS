//
//  IfLetView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 6/20/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI

struct IfLet<T, Out: View>: View {
    let value: T?
    let produce: (T) -> Out

    init(_ value: T?, produce: @escaping (T) -> Out) {
        self.value = value
        self.produce = produce
    }

    var body: some View {
        Group {
            if value != nil {
                produce(value!)
            }
        }
    }
}
