//
//  RosterView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 8/11/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI
import RoasterHammer_Shared

struct RosterView: View {
    let roster: RoasterResponse

    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(self.roster.detachments) { detachment in
                    DetachmentView(detachment: detachment)
                }
            }
        }
    }
}

//#if DEBUG
//struct RosterView_Previews: PreviewProvider {
//    static var previews: some View {
//        RosterView()
//    }
//}
//#endif
