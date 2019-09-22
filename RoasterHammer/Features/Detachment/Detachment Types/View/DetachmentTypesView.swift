//
//  DetachmentTypesView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 6/18/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI
import RoasterHammer_Shared

struct DetachmentTypesView : View {
    @ObservedObject var detachmentTypesData: DetachmentTypeInteractor
    @ObservedObject var roastersData: RoasterInteractor
    @Environment(\.presentationMode) private var presentationMode

    var body: some View {
        List {
            ForEach(detachmentTypesData.detachmentTypes, id: \.name) { detachmentType in
                Button(action: {
                                    self.detachmentTypesData.createDetachment(ofType: detachmentType, forRoster: self.roastersData)
                                    self.presentationMode.wrappedValue.dismiss()
                                }) {
                                    HStack {
                                        Text(detachmentType.name)
                                        Spacer()
                                        Text("\(detachmentType.commandPoints) CP")
                                    }
                                }
            }
        }
        .navigationBarTitle(Text("Detachment Selection"))
        .onAppear {
            self.detachmentTypesData.getDetachmentTypes()
        }
    }
}

//#if DEBUG
//struct DetachmentTypesView_Previews : PreviewProvider {
//    static var previews: some View {
//        DetachmentTypesView(detachmentTypesData: RoasterHammerDependencyManager.shared.detachmentTypeBuilder().buildDataStore(), armyId: 1, roaster: <#RoasterResponse#>)
//    }
//}
//#endif
