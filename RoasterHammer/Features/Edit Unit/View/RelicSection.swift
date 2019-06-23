//
//  RelicSection.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 6/23/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI
import RoasterHammer_Shared

struct RelicSection : View {
    @ObjectBinding var rosterData: RoasterInteractor
    let selectedUnit: SelectedUnitResponse
    let unitType: String
    let detachment: DetachmentResponse
    let role: RoleResponse

    var body: some View {
        Section(header: Text("Relics")) {
            ForEach(detachment.army.relics) { relic in
                Button(action: {
                    // TODO
                    print("Select relic")
                }) {
                    SelectableRow(name: relic.name,
                                    description: relic.description,
                                    isSelected: self.isRelicSelected(relic: relic, relics: self.detachment.army.relics))
                }
            }
        }
    }

    private func isRelicSelected(relic: RelicResponse, relics: [RelicResponse]) -> Bool {
        return relics.contains { (relicResponse) -> Bool in
            relicResponse.id == relic.id
        }
    }
}

//#if DEBUG
//struct RelicSection_Previews : PreviewProvider {
//    static var previews: some View {
//        RelicSection()
//    }
//}
//#endif
