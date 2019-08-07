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
    @ObservedObject var editUnitData: EditUnitInteractor
    var rosterData: RoasterInteractor
    let unitType: String
    let detachment: DetachmentResponse
    let role: RoleResponse
    @State var isWarlord: Bool

    private var uniqueModels: [SelectedModelResponse] {
        editUnitData.selectedUnit.models.unique { $0.model.name }
    }
    private var selectedUnit: SelectedUnitResponse {
        editUnitData.selectedUnit
    }

    var body: some View {
        List {
            ForEach(uniqueModels) { uniqueSelectedModel in
                Section(header: self.makeHeader(uniqueSelectedModel: uniqueSelectedModel)) {
                    ForEach(self.modelsByName(uniqueSelectedModel.model.name)) { selectedModel in
                        NavigationLink(destination: EditModelView(editModelData:
                            RoasterHammerDependencyManager
                                .shared
                                .editModelBuildable()
                                .buildDataStore(selectedModel: selectedModel,
                                                rosterInteractor: self.rosterData),
                                                                  detachment: self.detachment,
                                                                  selectedUnit: self.selectedUnit)) {
                                                                    EditUnitRow(selectedModel: selectedModel)
                        }
                    }

                    if self.unitType == "HQ" {
                        Toggle(isOn: self.$isWarlord) {
                            Text("Warlord")
                        }
                        .onTapGesture {
                            self.editUnitData.setUnitAsWarlord(detachmentId: self.detachment.id,
                                                               roleId: self.role.id,
                                                               unitId: self.selectedUnit.id)
                        }
                    }
                }
            }
            .onDelete(perform: self.deleteModel)

            if self.selectedUnit.isWarlord {
                WarlordTraitSection(editUnitData: editUnitData,
                                    unitType: unitType,
                                    detachment: detachment,
                                    role: role)

                RelicSection(editUnitData: editUnitData,
                             unitType: unitType,
                             detachment: detachment,
                             role: role)
            }

            if self.selectedUnit.unit.isPsycher {
                PsychicPowerSection(editUnitData: editUnitData,
                                    detachment: detachment)
            }
        }
        .navigationBarTitle(selectedUnit.unit.name)
    }

    private func modelsByName(_ name: String) -> [SelectedModelResponse] {
        return selectedUnit.models.filter { $0.model.name == name }
    }

    private func makeHeader(uniqueSelectedModel: SelectedModelResponse) -> some View {
        return HeaderAndActionButtonHeader(text: uniqueSelectedModel.model.name,
                                           buttonTitle: "Add",
                                           action: {
                                            self.editUnitData.addModel(uniqueSelectedModel.model.id,
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

//#if DEBUG
//struct EditUnitUI_Previews : PreviewProvider {
//    static var previews: some View {
//        EditUnitUI()
//    }
//}
//#endif
