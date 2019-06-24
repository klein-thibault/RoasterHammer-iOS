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
    @ObjectBinding var rosterData: RoasterInteractor
    let selectedUnit: SelectedUnitResponse
    let detachment: DetachmentResponse

    var body: some View {
        Section(header: Text("Psychic Powers")) {
            ForEach(selectedUnit.unit.availablePsychicPowers) { psychicPower in
                Button(action: {
                    // TODO: attach psychic power
                }) {
                    SelectableRow(name: psychicPower.name,
                                  description: psychicPower.description,
                                  isSelected: false)
                }
            }
        }
    }
}

//#if DEBUG
//struct PsychicPowerSection_Previews : PreviewProvider {
//    static var previews: some View {
//        PsychicPowerSection()
//    }
//}
//#endif
