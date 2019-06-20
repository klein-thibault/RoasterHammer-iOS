//
//  EditModelView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 6/20/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI

struct IfLet<T, Out: View>: View {
    let value: T?
    let produce: (T) -> Out

    init(_ value: T?, produce: @escaping (T) -> Out) {
        self.value = value
        self.produce = produce
    }

    var body: some View {
        Group {
            if value != nil {
                produce(value!)
            }
        }
    }
}

struct EditModelView : View {
    @ObjectBinding var rosterData: RoasterInteractor

    var body: some View {
        List {
            Section(header: Text("Weapons")) {
                ForEach(rosterData.selectedModel?.selectedWeapons ?? []) { weapon in
                    WeaponRow(weapon: weapon)
                }
            }
            .navigationBarTitle(Text(rosterData.selectedModel?.model.name ?? ""))
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
