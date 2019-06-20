//
//  WeaponRow.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 6/20/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI
import RoasterHammer_Shared

struct WeaponRow : View {
    let weapon: WeaponResponse

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Name")
                Text("Range")
                Text("Type")
                Text("S")
                Text("AP")
                Text("D")
//                Text("Cost")
//                Text("Ability")
            }
            HStack {
                Text(weapon.name)
                Text(weapon.range)
                Text(weapon.type)
                Text(weapon.strength)
                Text(weapon.armorPiercing)
                Text(weapon.damage)
//                Text(weapon.cost)
//                Text(weapon.ability)
            }
        }
    }
}

//#if DEBUG
//struct WeaponRow_Previews : PreviewProvider {
//    static var previews: some View {
//        WeaponRow(weapon: <#WeaponResponse#>)
//    }
//}
//#endif
