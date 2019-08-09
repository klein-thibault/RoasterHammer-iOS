//
//  UnitDetailView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 8/7/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI
import RoasterHammer_Shared

struct UnitDetailView: View {
    let selectedUnit: SelectedUnitResponse

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                UnitNameView(points: selectedUnit.cost, name: selectedUnit.unit.name)
                ForEach(selectedUnit.models) { model in
                    ModelDataView(selectedModel: model)
                    WeaponDataView(weapons: model.selectedWeapons)
                }
                UnitRulesView(rules: selectedUnit.unit.rules)
                Spacer()
            }
        }
        .padding()
    }
}

//#if DEBUG
//struct UnitDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        UnitDetailView()
//    }
//}
//#endif
