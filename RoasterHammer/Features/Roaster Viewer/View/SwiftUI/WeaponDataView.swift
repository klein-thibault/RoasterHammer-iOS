//
//  WeaponDataView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 8/7/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI
import RoasterHammer_Shared

struct WeaponDataView: View {
    let weapons: [WeaponResponse]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Weapons")
                .font(.headline)
            ForEach(weapons) { weapon in
                WeaponView(weapon: weapon)
            }
        }
    }
}

private struct WeaponView: View {
    let weapon: WeaponResponse

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(weapon.name)
            HStack {
                CharacteristicStackView(header: "Range", value: weapon.range)
                CharacteristicStackView(header: "Type", value: weapon.type)
                CharacteristicStackView(header: "S", value: weapon.strength)
                CharacteristicStackView(header: "AP", value: weapon.armorPiercing)
                CharacteristicStackView(header: "D", value: weapon.damage)
            }
            Text(weapon.ability)
        }
    }
}

//#if DEBUG
//struct WeaponDataView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeaponDataView()
//    }
//}
//#endif
