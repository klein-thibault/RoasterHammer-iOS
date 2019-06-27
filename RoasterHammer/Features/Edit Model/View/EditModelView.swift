//
//  EditModelView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 6/20/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI
import RoasterHammer_Shared

struct EditModelView : View {
    @ObjectBinding var rosterData: RoasterInteractor
    let detachment: DetachmentResponse
    let selectedUnit: SelectedUnitResponse

    var body: some View {
        List {
            ForEach(rosterData.selectedModel?.selectedWeapons ?? []) { weapon in
                WeaponRow(weapon: weapon)
            }
            .onDelete(perform: deleteWeapon)
        }
        .navigationBarTitle(Text(rosterData.selectedModel?.model.name ?? ""))
        .navigationBarItems(trailing:
            PresentationButton(destination: WeaponSelectionView(rosterData: rosterData, detachment: detachment, selectedUnit: selectedUnit),
                               label: {
                                Text("Add Weapons")
            }))
    }

    func deleteWeapon(at offsets: IndexSet) {
        if let first = offsets.first,
            let weapon = rosterData.selectedModel?.selectedWeapons[first] {
            rosterData.detachWeaponFromSelectedModel(weapon.id,
                                                     forModel: rosterData.selectedModel?.id ?? 0,
                                                     ofUnit: selectedUnit.id,
                                                     inDetachment: detachment.id)
        }
    }
}

//#if DEBUG
//struct EditModelView_Previews : PreviewProvider {
//    static var previews: some View {
//        EditModelView(rosterData: RoasterHammerDependencyManager.shared.roasterBuilder().buildDataStore(roaster: <#T##RoasterResponse#>))
//    }
//}
//#endif
