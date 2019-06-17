//
//  RoasterRow.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 6/16/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI
import RoasterHammer_Shared

struct RoasterRow : View {
    let roaster: RoasterResponse

    var body: some View {
        HStack {
            Text(self.roaster.name)
            Spacer()
            Text("\(self.roaster.totalCost) points")
        }
    }
}

//#if DEBUG
//struct RoasterRow_Previews : PreviewProvider {
//    static var previews: some View {
//        RoasterRow(roaster: <#RoasterResponse#>)
//    }
//}
//#endif
