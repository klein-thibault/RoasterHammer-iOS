//
//  UnitsUI.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 6/18/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI

struct UnitsUI : View {
    @ObjectBinding var unitsData: UnitsInteractor
    @ObjectBinding var roastersData: RoasterInteractor
    @Environment(\.isPresented) private var isPresented

    var body: some View {
        NavigationView {
            List {
                ForEach(unitsData.units) { unit in
                    Button(action: {
                        self.roastersData.addUnitToDetachment(unitId: unit.id,
                                                              detachmentId: self.unitsData.detachmentId,
                                                              unitRoleId: self.unitsData.unitRoleId,
                                                              quantity: 1)
                        self.isPresented?.value = false
                    }) {
                        Text(unit.name)
                    }
                }
            }
            .navigationBarTitle(Text("Available Units"))
        }
        .onAppear {
            self.unitsData.getUnits()
        }
    }
}

//#if DEBUG
//struct UnitsUI_Previews : PreviewProvider {
//    static var previews: some View {
//        UnitsUI()
//    }
//}
//#endif
