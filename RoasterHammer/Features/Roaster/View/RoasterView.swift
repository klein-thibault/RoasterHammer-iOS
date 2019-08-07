//
//  RoasterView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 6/18/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI
import RoasterHammer_Shared

struct RoasterView : View {
    @ObservedObject var roastersData: RoasterInteractor
    @State var isArmyPresented = false

    var armyButton: some View {
        Button(action: {
            self.isArmyPresented.toggle()
        }) {
            Image(systemName: "plus")
                .imageScale(.large)
                .accessibility(label: Text("Add Detachment"))
                .padding()
        }
    }

    private var detachments: [DetachmentResponse] {
        roastersData.roaster.detachments
    }
    private var roasterId: Int {
        roastersData.roaster.id
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(detachments) { detachment in
                    VStack {
                        FactionView(roastersData: self.roastersData, detachment: detachment)
                        DetachmentRow(roastersData: self.roastersData, detachment: detachment)
                        Button(action: {
                            self.roastersData.removeDetachment(detachmentId: detachment.id, rosterId: self.roasterId)
                        }) {
                            Text("Remove")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width)
        }
        .frame(width: UIScreen.main.bounds.width)
        .navigationBarTitle(Text(roastersData.roaster.name))
        .navigationBarItems(trailing: armyButton)
        .sheet(isPresented: $isArmyPresented) {
            ArmiesView(roastersData: self.roastersData)
        }
        .onAppear {
            self.roastersData.getRoasterDetails()
        }
    }
}

struct FactionView: View {
    @ObservedObject var roastersData: RoasterInteractor
    let detachment: DetachmentResponse

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("Faction")
                    .font(.headline)
                Spacer()
                NavigationLink(destination: DetachmentFactionView(rosterData: self.roastersData,
                                                                  detachment: self.detachment)) {
                                                                    Text("Edit")
                }
            }

            Text(detachment.selectedFaction?.name ?? "Select a faction")
        }
        .padding()
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

struct DetachmentRow: View {
    @ObservedObject var roastersData: RoasterInteractor
    let detachment: DetachmentResponse

    var body: some View {
        VStack(alignment: .leading) {
            DetachmentNameView(detachment: detachment)

            DetachmentRoleListView(roastersData: roastersData, detachment: detachment)
                .frame(height: listHeight(forDetachment: detachment))
        }
    }

    private func listHeight(forDetachment detachment: DetachmentResponse) -> CGFloat {
        let rolesHeight = CGFloat(detachment.roles.count * 44)
        let unitsHeight = CGFloat(detachment.totalUnits * 44)

        return rolesHeight + unitsHeight
    }
}

struct DetachmentRoleListView: View {
    @ObservedObject var roastersData: RoasterInteractor
    let detachment: DetachmentResponse

    var body: some View {
        List {
            ForEach(detachment.roles) { role in
                Section(header: self.makeHeader(detachment: self.detachment, role: role)) {
                    ForEach(role.units) { selectedUnit in
                        NavigationLink(destination: EditUnitView(editUnitData: RoasterHammerDependencyManager.shared.editUnitBuilder().buildDataStore(selectedUnit: selectedUnit, rosterInteractor: self.roastersData),
                            rosterData: self.roastersData,
                            unitType: role.name,
                            detachment: self.detachment,
                            role: role,
                            isWarlord: selectedUnit.isWarlord)) {
                                Text(selectedUnit.unit.name)
                        }
                    }
                }
            }
        }
    }

    private func makeHeader(detachment: DetachmentResponse, role: RoleResponse) -> some View {
        let unitFilters = UnitFilters(armyId: "\(detachment.army.id)", unitType: role.name)
        let destination = UnitsView(
            unitsData: RoasterHammerDependencyManager
                .shared
                .unitsBuilder()
                .buildDataStore(filters: unitFilters,
                                detachmentId: detachment.id,
                                unitRoleId: role.id),
            roastersData: roastersData)

        return HeaderAndNavigationButtonHeader(text: role.name,
                                               buttonTitle: "Add",
                                               destination: destination)
    }
}

//#if DEBUG
//struct RoasterUI_Previews : PreviewProvider {
//    static var previews: some View {
//        RoasterUI()
//    }
//}
//#endif
