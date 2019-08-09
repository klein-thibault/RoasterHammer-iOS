//
//  CharacteristicStackView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 8/7/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI

struct CharacteristicStackView: View {
    let header: String
    let value: String

    var body: some View {
        VStack {
            Text(header)
            Divider()
                .frame(height: 1)
                .foregroundColor(.black)
            Text(value)
        }
    }
}


#if DEBUG
struct CharacteristicStackView_Previews: PreviewProvider {
    static var previews: some View {
        CharacteristicStackView(header: "Header", value: "Value")
    }
}
#endif
