//
//  RoastersUI.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 6/16/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI

struct RoastersView: View {
    @ObjectBinding private var roastersData = RoasterHammerDependencyManager.shared.roastersBuilder().buildDataStore()

    var body: some View {
        NavigationView {
            List {
                ForEach(roastersData.roasters) { roaster in
                    NavigationLink(destination: RoasterView(roastersData: RoasterHammerDependencyManager.shared.roasterBuilder().buildDataStore(roaster: roaster))) {
                        RoasterRow(roaster: roaster)
                    }
                }
                .onDelete(perform: deleteRoster)
            }
            .navigationBarTitle(Text("Rosters"), displayMode: .large)
            .navigationBarItems(leading:
                PresentationLink(destination: AccountView(accountInteractor: RoasterHammerDependencyManager.shared.accountBuilder().buildDataStore()), label: {
                    Image(systemName: "person.crop.circle")
                        .imageScale(.large)
                        .accessibility(label: Text("User Profile"))
                        .padding()
                }),
                                trailing:
                PresentationLink(destination: CreateRoasterView(roastersData: self.roastersData), label: {
                    Image(systemName: "plus")
                        .imageScale(.large)
                        .accessibility(label: Text("Create Detachment"))
                        .padding()
                })
            )
        }
        .onAppear {
            self.roastersData.getRoasters()
        }
    }

    func deleteRoster(at offsets: IndexSet) {
        if let first = offsets.first {
            let roster = roastersData.roasters[first]
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
