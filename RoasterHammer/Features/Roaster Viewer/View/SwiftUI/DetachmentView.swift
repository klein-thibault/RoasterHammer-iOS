//
//  DetachmentView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 8/11/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI
import RoasterHammer_Shared

struct DetachmentView: View {
    let detachment: DetachmentResponse

    var body: some View {
        HStack {
            DetachmentDetailView(detachment: detachment)

            ForEach(self.detachment.roles) { role in
                ForEach(role.units) { selectedUnit in
                    UnitDetailView(selectedUnit: selectedUnit)
                        .frame(width: UIScreen.main.bounds.size.width)
                }
            }
        }
    }
}

//#if DEBUG
//struct DetachmentView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetachmentView()
//    }
//}
//#endif
