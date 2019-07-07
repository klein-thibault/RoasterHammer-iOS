//
//  CredentialsView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 6/17/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI

struct CredentialsView : View {
    @State var email = ""
    @State var password = ""

    @ObjectBinding var accountInteractor: AccountInteractor

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("RoasterHammer")
                    .font(.title)
                    .bold()

                TextField("Email", text: $email)
                    .textContentType(.emailAddress)
                SecureField("Password", text: $password)
                    .textContentType(.password)

                HStack {
                    Group {
                        Button(action: {
                            self.accountInteractor.login(email: self.email, password: self.password)
                        }) {
                            Text("Login")
                        }
                    }
                    .disabled(!accountInteractor.areCredentialsValid(email: email, password: password))

                    Text("or")

                    Button(action: {
                        self.accountInteractor.createAccount(email: self.email, password: self.password)
                    }) {
                        Text("Create Account")
                    }
                    .disabled(!accountInteractor.areCredentialsValid(email: email, password: password))
                }

                Spacer()
                }
                .padding()
        }
    }
}

#if DEBUG
struct CredentialsView_Previews : PreviewProvider {
    static var previews: some View {
        CredentialsView(accountInteractor: RoasterHammerDependencyManager.shared.accountBuilder().buildDataStore())
    }
}
#endif
