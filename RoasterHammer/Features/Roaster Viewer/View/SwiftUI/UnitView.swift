//
//  UnitView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 8/8/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI
import RoasterHammer_Shared

struct UnitView: View {
    let selectedUnits: [SelectedUnitResponse]

    var body: some View {
        GeometryReader { proxy in
            ScrollView(.horizontal) {
                HStack {
                    ForEach(self.selectedUnits) { selectedUnit in
                        UnitDetailView(selectedUnit: selectedUnit)
                            .frame(width: proxy.size.width)
                    }
                }
            }
        }
    }
}

//#if DEBUG
//struct UnitView_Previews: PreviewProvider {
//    static var previews: some View {
//        UnitView()
//    }
//}
//#endif
