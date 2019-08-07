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
    @ObservedObject var editUnitData: EditUnitInteractor
    let unitType: String
    let detachment: DetachmentResponse
    let role: RoleResponse

    var body: some View {
        Section(header: Text("Warlord Traits")) {
            ForEach(editUnitData.selectedUnit.unit.availableWarlordTraits) { warlordTrait in
                Button(action: {
                    self.editUnitData.setWarlordTraitToUnit(warlordTraitId: warlordTrait.id,
                                                            detachmentId: self.detachment.id,
                                                            roleId: self.role.id,
                                                            unitId: self.editUnitData.selectedUnit.id)
                }) {
                    SelectableRow(name: warlordTrait.name,
                                  description: warlordTrait.description,
                                  isSelected: self.isWarlordTraitSelected(warlordTrait: warlordTrait, unit: self.editUnitData.selectedUnit))
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
