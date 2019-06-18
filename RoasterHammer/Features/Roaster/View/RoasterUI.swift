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
        List {
            ForEach(roastersData.roaster.detachments) { detachment in
                Text(detachment.name)
            }
        }
        .navigationBarTitle(Text(roastersData.roaster.name))
        .navigationBarItems(trailing:
            PresentationButton(
                Text("Add Detachment"),
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
