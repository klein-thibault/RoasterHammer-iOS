//
//  HeaderAndNavigationButtonHeader.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 6/19/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI

struct HeaderAndNavigationButtonHeader<Destination>: View where Destination: View {
    @State private var isModalPresented = false

    let text: String
    let buttonTitle: String
    let destination: Destination

    private var presentationButton: some View {
        Button(action: {
            self.isModalPresented.toggle()
        }) {
            Text(buttonTitle)
        }
    }

    var body: some View {
        HStack {
            Text(text)
            Spacer()
            presentationButton
        }
        .sheet(isPresented: $isModalPresented) {
            self.destination
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
