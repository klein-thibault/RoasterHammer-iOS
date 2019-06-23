//
//  WarlordTraitRow.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 6/23/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI
import RoasterHammer_Shared

struct WarlordTraitRow: View {
    let warlordTrait: WarlordTraitResponse
    let isSelected: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(warlordTrait.name)
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark")
                        .imageScale(.large)
                        .accessibility(label: Text("Create Detachment"))
                }
            }

            Text(warlordTrait.description)
                .font(.footnote)
        }
    }
}

#if DEBUG
struct WarlordTraitRow_Previews : PreviewProvider {
    static var previews: some View {
        WarlordTraitRow(warlordTrait: WarlordTraitResponse(warlordTraitDTO: WarlordTraitDTO(id: 1,
                                                                                            name: "Warlord Trait",
                                                                                            description: "Warlord Trait Description")),
                        isSelected: true)
    }
}
#endif
