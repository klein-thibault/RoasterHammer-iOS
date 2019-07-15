//
//  PsychicPowerSection.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 6/23/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI
import RoasterHammer_Shared

struct PsychicPowerSection : View {
    @ObjectBinding var editUnitData: EditUnitInteractor
    let detachment: DetachmentResponse

    var body: some View {
        Section(header: Text("Psychic Powers")) {
            ForEach(editUnitData.selectedUnit.unit.availablePsychicPowers) { psychicPower in
                Button(action: {
                    if self.isPsychicPowerSelected(psychicPower: psychicPower,
                                                   selectedPsychicPowers: self.editUnitData.selectedUnit.psychicPowers) {
                        self.editUnitData.unsetPsychicPowerFromUnit(unitId: self.editUnitData.selectedUnit.id,
                                                                    detachmentId: self.detachment.id,
                                                                    psychicPowerId: psychicPower.id)
                    } else {
                        self.editUnitData.setPsychicPowerToUnit(unitId: self.editUnitData.selectedUnit.id,
                                                                detachmentId: self.detachment.id,
                                                                psychicPowerId: psychicPower.id)
                    }
                }) {
                    SelectableRow(name: psychicPower.name,
                                  description: psychicPower.description,
                                  isSelected: self.isPsychicPowerSelected(psychicPower: psychicPower,
                                                                          selectedPsychicPowers: self.editUnitData.selectedUnit.psychicPowers))
                }
            }
        }
    }

    private func isPsychicPowerSelected(psychicPower: PsychicPowerResponse,
                                        selectedPsychicPowers: [PsychicPowerResponse]?) -> Bool {
        guard let selectedPsychicPowers = selectedPsychicPowers else { return false }
        return selectedPsychicPowers
            .filter { $0.id == psychicPower.id }
            .first != nil
    }
}

//#if DEBUG
//struct PsychicPowerSection_Previews : PreviewProvider {
//    static var previews: some View {
//        PsychicPowerSection()
//    }
//}
//#endif
