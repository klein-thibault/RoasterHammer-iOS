//
//  AccountUI.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 6/16/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI

struct AccountUI : View {
    @ObjectBinding private var accountInteractor = RoasterHammerDependencyManager.shared.accountBuilder().buildDataStore()

    var body: some View {
        VStack {
            if accountInteractor.isUserLoggedIn() {
                ProfileView()
            } else {
                CredentialsView()
            }
        }
    }
}

#if DEBUG
struct AccountUI_Previews : PreviewProvider {
    static var previews: some View {
        AccountUI()
    }
}
#endif
