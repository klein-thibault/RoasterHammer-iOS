//
//  EditUnitRow.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 7/15/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI
import RoasterHammer_Shared

struct EditUnitRow: View {
    let selectedModel: SelectedModelResponse

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(selectedModel.model.name)
                Spacer()
                Text("\(selectedModel.cost) points")
            }

            ForEach(selectedModel.selectedWeapons) { weapon in
                Text(weapon.name)
                    .font(.caption)
            }
        }
    }
}

//#if DEBUG
//struct EditUnitRow_Previews : PreviewProvider {
//    static var previews: some View {
//        EditUnitRow()
//    }
//}
//#endif
