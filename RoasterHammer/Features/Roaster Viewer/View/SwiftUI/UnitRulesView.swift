//
//  UnitRulesView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 8/7/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI
import RoasterHammer_Shared

struct UnitRulesView: View {
    let rules: [RuleResponse]

    var body: some View {
        VStack(alignment: .leading) {
            ForEach(rules, id: \.name) { rule in
                HStack {
                    Text(rule.name)
                    Text(rule.description)
                }
            }
        }
    }
}

//#if DEBUG
//struct UnitRulesView_Previews: PreviewProvider {
//    static var previews: some View {
//        UnitRulesView()
//    }
//}
//#endif
