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
    var roaster: RoasterResponse

    var body: some View {
        Text(self.roaster.name)
//        VStack(alignment: .leading) {
//            Text(self.roaster.name)
//            Text(self.roaster.totalCost)
//        }
//        .padding()
    }
}

//#if DEBUG
//struct RoasterRow_Previews : PreviewProvider {
//    static var previews: some View {
//        RoasterRow(roaster: <#RoasterResponse#>)
//    }
//}
//#endif
