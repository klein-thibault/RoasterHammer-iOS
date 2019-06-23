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
                    self.rosterData.setRelicToUnit(relicId: relic.id,
                                                   detachmentId: self.detachment.id,
                                                   roleId: self.role.id,
                                                   unitId: self.selectedUnit.id)
                }) {
                    SelectableRow(name: relic.name,
                                    description: relic.description,
                                    isSelected: self.isRelicSelected(relic: relic,
                                                                     selectedRelic: self.rosterData.selectedUnit?.relic))
                }
            }
        }
    }

    private func isRelicSelected(relic: RelicResponse, selectedRelic: RelicResponse?) -> Bool {
        guard let selectedRelic = selectedRelic else { return false }

        return relic.id == selectedRelic.id
    }
}

//#if DEBUG
//struct RelicSection_Previews : PreviewProvider {
//    static var previews: some View {
//        RelicSection()
//    }
//}
//#endif
