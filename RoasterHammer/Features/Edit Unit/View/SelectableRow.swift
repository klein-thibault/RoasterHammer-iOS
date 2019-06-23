//
//  SelectableRow.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 6/23/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI
import RoasterHammer_Shared

struct SelectableRow: View {
    let name: String
    let description: String
    let isSelected: Bool

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack {
                Text(name)
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark")
                        .imageScale(.large)
                        .accessibility(label: Text("Create Detachment"))
                }
            }

            Text(description)
                .font(.footnote)
        }
    }
}

#if DEBUG
struct WarlordTraitRow_Previews : PreviewProvider {
    static var previews: some View {
        SelectableRow(name: "Name", description: "Description", isSelected: true)
    }
}
#endif
