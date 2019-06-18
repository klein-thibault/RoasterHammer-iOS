//
//  RoasterUI.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 6/18/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI
import RoasterHammer_Shared

struct RoasterUI : View {
    @ObjectBinding var roastersData: RoasterInteractor

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(roastersData.roaster.detachments) { detachment in
                    VStack(alignment: .leading) {
                        Text(detachment.name)
                            .font(.headline)
                            .padding()

                        List {
                            ForEach(detachment.roles) { role in
                                Section(header: Text(role.name)) {
                                    ForEach(role.units) { selectedUnit in
                                        Text(selectedUnit.unit.name)
                                    }
                                }
                            }
                        }
                        .frame(minHeight: 200, maxHeight: .infinity)
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width)
        }
        .frame(width: UIScreen.main.bounds.width)
        .navigationBarTitle(Text(roastersData.roaster.name))
        .navigationBarItems(trailing:
            PresentationButton(
                Image(systemName: "plus")
                    .imageScale(.large)
                    .accessibility(label: Text("Add Detachment"))
                    .padding(),
                destination: ArmiesView(roastersData: roastersData)
            )
        )
        .onAppear {
            self.roastersData.getRoasterDetails()
        }
    }
}

//#if DEBUG
//struct RoasterUI_Previews : PreviewProvider {
//    static var previews: some View {
//        RoasterUI()
//    }
//}
//#endif
