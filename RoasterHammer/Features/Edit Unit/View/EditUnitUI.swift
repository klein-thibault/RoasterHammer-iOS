//
//  EditUnitUI.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 6/19/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI
import RoasterHammer_Shared

struct EditUnitUI : View {
    @ObjectBinding var rosterData: RoasterInteractor
    var selectedUnit: SelectedUnitResponse

    private var uniqueModels: [SelectedModelResponse] {
        return selectedUnit.models.unique { $0.model.name }
    }

    var body: some View {
        List {
            ForEach(uniqueModels) { uniqueSelectedModel in
                Section(header: EditUnitHeader(selectedModel: uniqueSelectedModel)) {
                    ForEach(self.modelsByName(uniqueSelectedModel.model.name)) { selectedModel in
                        EditUnitRow(selectedModel: selectedModel)
                    }
                }
            }
        }
        .onAppear {
            self.rosterData.selectedUnit = self.selectedUnit
        }
    }

    private func modelsByName(_ name: String) -> [SelectedModelResponse] {
        return selectedUnit.models.filter { $0.model.name == name }
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
        HStack {
            Text(selectedModel.model.name)
            Spacer()
            Text("\(selectedModel.cost) points")
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
