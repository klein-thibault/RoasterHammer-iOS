//
//  WeaponSelectionView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 6/27/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI
import RoasterHammer_Shared

struct WeaponSelectionView : View {
    @ObservedObject var editModelData: EditModelInteractor
    @Environment(\.presentationMode) private var presentationMode
    let detachment: DetachmentResponse
    let selectedUnit: SelectedUnitResponse

    var body: some View {
        NavigationView {
            List {
                ForEach(editModelData.selectedModel.model.weaponBuckets) { weaponBucket in
                    Section(header: Text(weaponBucket.name)) {
                        ForEach(weaponBucket.weapons) { weapon in
                            Button(action: {
                                self.editModelData.attachWeaponToSelectedModel(weapon.id,
                                                                               fromWeaponBucket: weaponBucket.id,
                                                                               forModel: self.editModelData.selectedModel.id,
                                                                               ofUnit: self.selectedUnit.id,
                                                                               inDetachment: self.detachment.id)
                                self.presentationMode.wrappedValue.dismiss()
                            }) {
                                Text(weapon.name)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Available Weapons"))
        }
    }
}

//#if DEBUG
//struct WeaponSelectionView_Previews : PreviewProvider {
//    static var previews: some View {
//        WeaponSelectionView()
//    }
//}
//#endif
