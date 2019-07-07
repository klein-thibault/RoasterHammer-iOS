//
//  CreateRoasterView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 6/17/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI

struct CreateRoasterView : View {
    @ObjectBinding var roastersData: RoastersInteractor
    @State var roasterName: String = ""
    @Environment(\.isPresented) private var isPresented

    var body: some View {
        VStack(spacing: 20) {
            TextField("Roster Name", text: $roasterName)

            Button(action: {
                if self.roasterName.count > 0 {
                    self.roastersData.createRoaster(name: self.roasterName)
                    self.isPresented?.value = false
                }
            }) {
                Text("Create")
            }

            Spacer()
        }
        .padding()
    }
}

#if DEBUG
struct CreateRoasterView_Previews : PreviewProvider {
    static var previews: some View {
        CreateRoasterView(roastersData: RoasterHammerDependencyManager.shared.roastersBuilder().buildDataStore())
    }
}
#endif
