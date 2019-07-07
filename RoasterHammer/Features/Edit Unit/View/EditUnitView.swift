//
//  EditUnitView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 6/19/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI
import RoasterHammer_Shared

struct EditUnitView : View {
    @ObjectBinding var rosterData: RoasterInteractor
    var selectedUnit: SelectedUnitResponse
    let unitType: String
    let detachment: DetachmentResponse
    let role: RoleResponse
    @State var isWarlord: Bool

    private var uniqueModels: [SelectedModelResponse] {
        return rosterData.selectedUnit?.models.unique { $0.model.name } ?? []
    }

    var body: some View {
        List {
            ForEach(uniqueModels) { uniqueSelectedModel in
                Section(header: self.makeHeader(uniqueSelectedModel: uniqueSelectedModel)) {
                    ForEach(self.modelsByName(uniqueSelectedModel.model.name)) { selectedModel in
                        NavigationLink(destination: EditModelView(rosterData: self.rosterData,
                                                                    detachment: self.detachment,
                                                                    selectedUnit: self.selectedUnit),
                                         onTrigger: { () -> Bool in
                                            self.rosterData.selectedModel = selectedModel
                                            return true
                        }) {
                            EditUnitRow(selectedModel: selectedModel)
                        }
                    }

                    if self.unitType == "HQ" {
                        Toggle(isOn: self.$isWarlord) {
                            Text("Warlord")
                        }
                        .tapAction {
                            self.rosterData.setUnitAsWarlord(detachmentId: self.detachment.id,
                                                             roleId: self.role.id,
                                                             unitId: self.selectedUnit.id)
                        }
                    }
                }
            }
            .onDelete(perform: self.deleteModel)

            if self.rosterData.selectedUnit?.isWarlord ?? false {
                WarlordTraitSection(rosterData: rosterData,
                                    selectedUnit: selectedUnit,
                                    unitType: unitType,
                                    detachment: detachment,
                                    role: role)

                RelicSection(rosterData: rosterData,
                             selectedUnit: selectedUnit,
                             unitType: unitType,
                             detachment: detachment,
                             role: role)
            }

            if self.rosterData.selectedUnit?.unit.isPsycher ?? false {
                PsychicPowerSection(rosterData: rosterData,
                                    selectedUnit: selectedUnit,
                                    detachment: detachment)
            }
        }
    }

    private func modelsByName(_ name: String) -> [SelectedModelResponse] {
        return rosterData.selectedUnit?.models.filter { $0.model.name == name } ?? []
    }

    private func makeHeader(uniqueSelectedModel: SelectedModelResponse) -> some View {
        return HeaderAndActionButtonHeader(text: uniqueSelectedModel.model.name,
                                           buttonTitle: "Add",
                                           action: {
                                            self.rosterData.addModel(uniqueSelectedModel.model.id,
                                                                     toUnit: self.selectedUnit.id,
                                                                     inDetachment: self.detachment.id)
        })
    }

    private func deleteModel(at offsets: IndexSet) {
        print(offsets)
    }
}

struct EditUnitHeader: View {
    let selectedModel: SelectedModelResponse

    var body: some View {
        HStack {
            Text(selectedModel.model.name)
            Spacer()
            Button(action: {
                // TODO
            }) {
                Text("Edit")
            }
        }
    }
}

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
            }
        }
    }
}

//#if DEBUG
//struct EditUnitUI_Previews : PreviewProvider {
//    static var previews: some View {
//        EditUnitUI()
//    }
//}
//#endif
