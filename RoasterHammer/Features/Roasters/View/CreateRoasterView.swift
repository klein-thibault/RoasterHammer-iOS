//
//  CreateRoasterView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 6/17/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI

struct CreateRoasterView : View {
    @ObservedObject var roastersData: RoastersInteractor
    @State var roasterName: String = ""
    @Environment(\.presentationMode) private var presentationMode

    var body: some View {
        VStack(spacing: 20) {
            TextField("Roster Name", text: $roasterName)

            Button(action: {
                if self.roasterName.count > 0 {
                    self.roastersData.createRoaster(name: self.roasterName)
                    self.presentationMode.wrappedValue.dismiss()
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
