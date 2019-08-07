//
//  DetachmentFactionView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 6/24/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI
import RoasterHammer_Shared

struct DetachmentFactionView : View {
    @ObservedObject var rosterData: RoasterInteractor
    let detachment: DetachmentResponse

    var body: some View {
        List {
            ForEach(detachment.army.factions) { faction in
                Button(action: {
                    self.rosterData.setDetachmentFaction(factionId: faction.id,
                                                         detachmentId: self.detachment.id,
                                                         rosterId: self.rosterData.roaster.id)
                }) {
                    Text(faction.name)
                }
            }
        }
        .navigationBarTitle(Text("Factions"))
    }
}

//#if DEBUG
//struct DetachmentFactionView_Previews : PreviewProvider {
//    static var previews: some View {
//        DetachmentFactionView()
//    }
//}
//#endif
