//
//  DetachmentDetailView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 8/11/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI
import RoasterHammer_Shared

struct DetachmentDetailView: View {
    let detachment: DetachmentResponse

    var body: some View {
        VStack {
            Text(self.detachment.army.name)
                .font(.title)
                .padding()
            Text(self.detachment.name)
                .font(.title)
            Text("\(self.detachment.totalCost) points")
                .font(.headline)
            Text("\(self.detachment.commandPoints) CPs")
                .font(.headline)
            Text(self.detachment.selectedFaction?.name ?? "")
                .font(.headline)
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.size.width)
    }
}
