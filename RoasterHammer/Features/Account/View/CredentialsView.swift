//
//  CredentialsView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 6/17/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI

struct CredentialsView : View {
    @State var email: String = ""
    @State var password: String = ""

    var body: some View {
        VStack {
            TextField($email, placeholder: Text("Email"))
            TextField($password, placeholder: Text("Password"))

            HStack {
                Button(action: {
                    //TODO
                }) {
                    Text("Login")
                }

                Button(action: {
                    //TODO
                }) {
                    Text("Create Account")
                }
            }

            Spacer()
        }
        .padding()
    }
}

#if DEBUG
struct CredentialsView_Previews : PreviewProvider {
    static var previews: some View {
        CredentialsView()
    }
}
#endif
