//
//  WarlordTraitSection.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 6/23/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI
import RoasterHammer_Shared

struct WarlordTraitSection : View {
    @ObjectBinding var rosterData: RoasterInteractor
    let selectedUnit: SelectedUnitResponse
    let unitType: String
    let detachment: DetachmentResponse
    let role: RoleResponse

    var body: some View {
        Section(header: Text("Warlord Traits")) {
            ForEach(selectedUnit.unit.availableWarlordTraits) { warlordTrait in
                Button(action: {
                    self.rosterData.setWarlordTraitToUnit(warlordTraitId: warlordTrait.id,
                                                          detachmentId: self.detachment.id,
                                                          roleId: self.role.id,
                                                          unitId: self.selectedUnit.id)
                }) {
                    SelectableRow(name: warlordTrait.name,
                                    description: warlordTrait.description,
                                    isSelected: self.isWarlordTraitSelected(warlordTrait: warlordTrait, unit: self.selectedUnit))
                }
            }
        }
    }

    private func isWarlordTraitSelected(warlordTrait: WarlordTraitResponse, unit: SelectedUnitResponse) -> Bool {
        guard let selectedWarlordTrait = unit.warlordTrait else { return false }
        return selectedWarlordTrait.id == warlordTrait.id
    }
}

//#if DEBUG
//struct WarlordTraitSection_Previews : PreviewProvider {
//    static var previews: some View {
//        WarlordTraitSection()
//    }
//}
//#endif
