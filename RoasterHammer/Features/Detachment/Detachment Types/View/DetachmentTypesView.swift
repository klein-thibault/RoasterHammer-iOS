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
    @ObjectBinding var detachmentTypesData: DetachmentTypeInteractor
    @Environment(\.isPresented) private var isPresented

    let armyId: Int
    let roaster: RoasterResponse

    var body: some View {
        List {
            ForEach(detachmentTypesData.detachmentTypes.identified(by: \.name)) { detachmentType in
                Button(action: {
                    self.detachmentTypesData.createDetachment(ofType: detachmentType)
                    self.isPresented?.value = false
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
