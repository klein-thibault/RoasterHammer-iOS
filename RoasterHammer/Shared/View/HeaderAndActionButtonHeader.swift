//
//  HeaderAndActionButtonHeader.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 6/19/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI

struct HeaderAndActionButtonHeader: View {
    let text: String
    let buttonTitle: String
    let action: () -> Void

    var body: some View {
        HStack {
            Text(text)
            Spacer()
            Button(action: self.action) {
                Text(buttonTitle)
            }
        }
    }
}

#if DEBUG
struct HeaderAndActionButtonHeader_Previews : PreviewProvider {
    static var previews: some View {
        HeaderAndActionButtonHeader(text: "Test", buttonTitle: "Title", action: { print("Action Executed")})
    }
}
#endif
