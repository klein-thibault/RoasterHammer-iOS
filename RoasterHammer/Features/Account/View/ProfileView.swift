//
//  ProfileView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 6/17/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI

struct ProfileView : View {
    @ObservedObject var accountInteractor: AccountInteractor

    var body: some View {
        HStack {
            Button(action: {
                self.accountInteractor.logout()
            }) {
                Text("Log Out")
            }
        }
    }
}

#if DEBUG
struct ProfileView_Previews : PreviewProvider {
    static var previews: some View {
        ProfileView(accountInteractor: RoasterHammerDependencyManager.shared.accountBuilder().buildDataStore())
    }
}
#endif
