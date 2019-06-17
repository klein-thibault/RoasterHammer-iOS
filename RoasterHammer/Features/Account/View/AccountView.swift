//
//  AccountView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 6/16/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI

struct AccountView : View {
    @ObjectBinding var accountInteractor: AccountInteractor

    var body: some View {
        VStack {
            if accountInteractor.isUserLoggedIn() {
                ProfileView(accountInteractor: accountInteractor)
            } else {
                CredentialsView(accountInteractor: accountInteractor)
            }
        }
    }
}

#if DEBUG
struct AccountUI_Previews : PreviewProvider {
    static var previews: some View {
        AccountView(accountInteractor: RoasterHammerDependencyManager.shared.accountBuilder().buildDataStore())
    }
}
#endif
