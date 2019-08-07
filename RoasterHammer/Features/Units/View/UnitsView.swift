//
//  UnitsView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 6/18/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI

struct UnitsView : View {
    @ObservedObject var unitsData: UnitsInteractor
    @ObservedObject var roastersData: RoasterInteractor
    @Environment(\.presentationMode) private var presentationMode

    var body: some View {
        NavigationView {
            List {
                ForEach(unitsData.units) { unit in
                    Button(action: {
                        self.roastersData.addUnitToDetachment(unitId: unit.id,
                                                              detachmentId: self.unitsData.detachmentId,
                                                              unitRoleId: self.unitsData.unitRoleId,
                                                              quantity: 1)
                        self.presentationMode.value.dismiss()
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
//struct UnitsView_Previews : PreviewProvider {
//    static var previews: some View {
//        UnitsUI()
//    }
//}
//#endif
