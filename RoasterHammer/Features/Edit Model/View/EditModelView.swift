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
    @ObjectBinding var editModelData: EditModelInteractor
    let detachment: DetachmentResponse
    let selectedUnit: SelectedUnitResponse

    private var selectedModel: SelectedModelResponse {
        editModelData.selectedModel
    }

    var body: some View {
        List {
            ForEach(selectedModel.selectedWeapons) { weapon in
                WeaponRow(weapon: weapon)
            }
            .onDelete(perform: deleteWeapon)
        }
        .navigationBarTitle(Text(selectedModel.model.name))
        .navigationBarItems(trailing:
            PresentationLink(destination: WeaponSelectionView(editModelData: editModelData,
                                                              detachment: detachment,
                                                              selectedUnit: selectedUnit),
                             label: {
                                Text("Add Weapons")
            }))
    }

    func deleteWeapon(at offsets: IndexSet) {
        if let first = offsets.first {
            let weapon = selectedModel.selectedWeapons[first]
            editModelData.detachWeaponFromSelectedModel(weapon.id,
                                                        forModel: selectedModel.id,
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
