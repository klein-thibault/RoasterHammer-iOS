//
//  UnitNameView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 8/7/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI

struct UnitNameView: View {
    let points: Int
    let name: String

    var body: some View {
        HStack {
            Text("\(points) points")
            Spacer()
            Text(name)
                .font(.title)
        }
    }
}

#if DEBUG
struct UnitNameView_Previews: PreviewProvider {
    static var previews: some View {
        UnitNameView(points: 15, name: "Space Marines")
    }
}
#endif
