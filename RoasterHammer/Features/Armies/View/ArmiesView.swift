//
//  ArmiesView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 6/18/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI
import RoasterHammer_Shared

struct ArmiesView : View {
    @ObjectBinding var armiesData = RoasterHammerDependencyManager.shared.armiesBuilder().buildDataStore()
    @ObjectBinding var roastersData: RoasterInteractor

    var body: some View {
        NavigationView {
            List {
                ForEach(armiesData.armies) { army in
                    NavigationButton(
                        destination: DetachmentTypesView(
                            detachmentTypesData: RoasterHammerDependencyManager
                                .shared
                                .detachmentTypeBuilder()
                                .buildDataStore(armyId: army.id),
                            roastersData: self.roastersData)
                    ) {
                        Text(army.name)
                    }
                }
            }
            .navigationBarTitle(Text("Army Selection"))
        }
        .onAppear {
            self.armiesData.getArmies()
        }
    }
}

//#if DEBUG
//struct ArmiesView_Previews : PreviewProvider {
//    static var previews: some View {
//        ArmiesUI()
//    }
//}
//#endif
