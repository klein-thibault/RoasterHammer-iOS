//
//  HeaderAndNavigationButtonHeader.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 6/19/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI

struct HeaderAndNavigationButtonHeader<Destination>: View where Destination: View {
    let text: String
    let buttonTitle: String
    let destination: Destination

    var body: some View {
        HStack {
            Text(text)
            Spacer()
            PresentationButton(destination: destination) {
                Text(buttonTitle)
            }
        }
    }
}

#if DEBUG
struct HeaderAndNavigationButtonHeader_Previews : PreviewProvider {
    static var previews: some View {
        HeaderAndNavigationButtonHeader(text: "Test",
                                        buttonTitle: "Title",
                                        destination: Text("Destination"))
    }
}
#endif
