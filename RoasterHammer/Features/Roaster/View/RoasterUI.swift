//
//  RoasterUI.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 6/18/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI
import RoasterHammer_Shared

struct RoasterUI : View {
    @ObjectBinding var roastersData: RoasterInteractor

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(roastersData.roaster.detachments) { detachment in
                    VStack(alignment: .leading) {
                        DetachmentNameView(detachment: detachment)

                        List {
                            ForEach(detachment.roles) { role in
                                Section(header: self.makeHeader(detachment: detachment, role: role)) {
                                    ForEach(role.units) { selectedUnit in
                                        Text(selectedUnit.unit.name)
                                    }
                                }
                            }
                        }
                        .frame(minHeight: 200, maxHeight: .infinity)
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width)
        }
        .frame(width: UIScreen.main.bounds.width)
        .navigationBarTitle(Text(roastersData.roaster.name))
        .navigationBarItems(trailing:
            PresentationButton(
                Image(systemName: "plus")
                    .imageScale(.large)
                    .accessibility(label: Text("Add Detachment"))
                    .padding(),
                destination: ArmiesView(roastersData: roastersData)
            )
        )
        .onAppear {
            self.roastersData.getRoasterDetails()
        }
    }

    func makeHeader(detachment: DetachmentResponse, role: RoleResponse) -> some View {
        let unitFilters = UnitFilters(armyId: "\(detachment.army.id)", unitType: role.name)
        let destination = UnitsView(
            unitsData: RoasterHammerDependencyManager
                .shared
                .unitsBuilder()
                .buildDataStore(filters: unitFilters,
                                detachmentId: detachment.id,
                                unitRoleId: role.id),
            roastersData: roastersData)

        return HeaderAndButtonListHeaderView(text: role.name,
                                             buttonTitle: "Add",
                                             destination: destination)
    }
}

struct DetachmentNameView: View {
    let detachment: DetachmentResponse

    var body: some View {
        HStack {
            Text(detachment.name)
                .font(.headline)
                .padding()

            Spacer()

            Text("\(detachment.totalCost) points")
                .font(.headline)
                .padding()
        }
    }
}

struct HeaderAndButtonListHeaderView<Destination>: View where Destination: View {
    let text: String
    let buttonTitle: String
    let destination: Destination

    var body: some View {
        HStack {
            Text(text)
            Spacer()
            PresentationButton(Text(buttonTitle), destination: destination)
        }
    }
}

//#if DEBUG
//struct RoasterUI_Previews : PreviewProvider {
//    static var previews: some View {
//        RoasterUI()
//    }
//}
//#endif
