//
//  RoastersUI.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 6/16/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI
import RoasterHammer_Shared

fileprivate enum ModalViewIndex: Int {
    case notSupported
    case account
    case createRoster
}

struct RoastersView: View {
    @ObjectBinding private var roastersData = RoasterHammerDependencyManager.shared.roastersBuilder().buildDataStore()
    @State var showModal = false
    @State var modalSelected = ModalViewIndex.notSupported.rawValue

    var accountButton: some View {
        Button(action: {
            self.showModal.toggle()
            self.modalSelected = ModalViewIndex.account.rawValue
        }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
    }
    var createRosterButton: some View {
        Button(action: {
            self.showModal.toggle()
            self.modalSelected = ModalViewIndex.createRoster.rawValue
        }) {
            Image(systemName: "plus")
                .imageScale(.large)
                .accessibility(label: Text("Create Detachment"))
                .padding()
        }
    }

    private var rosters: [RoasterResponse] {
        roastersData.roasters
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(rosters) { roaster in
                    NavigationLink(destination:
                        RoasterView(roastersData: RoasterHammerDependencyManager
                            .shared
                            .roasterBuilder()
                            .buildDataStore(roaster: roaster))) {
                                RoasterRow(roaster: roaster)
                    }
                }
                .onDelete(perform: deleteRoster)
            }
            .navigationBarTitle(Text("Rosters"), displayMode: .large)
            .navigationBarItems(leading: accountButton,
                                trailing: createRosterButton)
            .sheet(isPresented: $showModal) {
                if self.modalSelected == ModalViewIndex.account.rawValue {
                    AccountView(accountInteractor: RoasterHammerDependencyManager.shared.accountBuilder().buildDataStore())
                } else if self.modalSelected == ModalViewIndex.createRoster.rawValue {
                    CreateRoasterView(roastersData: self.roastersData)
                }
            }
        }
        .onAppear {
            self.roastersData.getRoasters()
        }
    }

    func deleteRoster(at offsets: IndexSet) {
        if let first = offsets.first {
            let roster = rosters[first]
            roastersData.removeRoster(rosterId: roster.id)
        }
    }
}

#if DEBUG
struct RoastersUI_Previews : PreviewProvider {
    static var previews: some View {
        RoastersView()
    }
}
#endif
