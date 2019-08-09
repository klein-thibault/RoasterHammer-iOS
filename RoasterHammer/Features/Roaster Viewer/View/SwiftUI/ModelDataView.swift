//
//  ModelDataView.swift
//  RoasterHammer
//
//  Created by Thibault Klein on 8/7/19.
//  Copyright © 2019 Thibault Klein. All rights reserved.
//

import SwiftUI
import RoasterHammer_Shared

struct ModelDataView: View {
    let selectedModel: SelectedModelResponse

    var body: some View {
        VStack(alignment: .leading) {
            Text(selectedModel.model.name)
                .font(.headline)
            ModelCharacteristicsSheetView(characteristics: selectedModel.model.characteristics)
        }
    }
}

private struct ModelCharacteristicsSheetView: View {
    let characteristics: CharacteristicsDTO
    private let divider = VerticalDivider()

    var body: some View {
        HStack(spacing: 0) {
            ModelMovementView(characteristics: characteristics)
            ModelSkillsView(characteristics: characteristics)
            ModelResilienceView(characteristics: characteristics)
            ModelAttackView(characteristics: characteristics)
            ModelLeadershipView(characteristics: characteristics)
            ModelSaveView(characteristics: characteristics)
        }
    }
}

private struct ModelMovementView: View {
    let characteristics: CharacteristicsDTO

    var body: some View {
        HStack(spacing: 0) {
            CharacteristicStackView(header: "M", value: characteristics.movement)
            VerticalDivider()
        }
    }
}

private struct ModelSkillsView: View {
    let characteristics: CharacteristicsDTO

    var body: some View {
        HStack(spacing: 0) {
            CharacteristicStackView(header: "WS", value: characteristics.weaponSkill)
            VerticalDivider()
            CharacteristicStackView(header: "BS", value: characteristics.balisticSkill)
            VerticalDivider()
        }
    }
}

private struct ModelResilienceView: View {
    let characteristics: CharacteristicsDTO

    var body: some View {
        HStack(spacing: 0) {
            CharacteristicStackView(header: "S", value: characteristics.strength)
            VerticalDivider()
            CharacteristicStackView(header: "T", value: characteristics.toughness)
            VerticalDivider()
            CharacteristicStackView(header: "W", value: characteristics.wounds)
            VerticalDivider()
        }
    }
}

private struct ModelAttackView: View {
    let characteristics: CharacteristicsDTO

    var body: some View {
        HStack(spacing: 0) {
            CharacteristicStackView(header: "A", value: characteristics.attacks)
            VerticalDivider()
        }
    }
}

private struct ModelLeadershipView: View {
    let characteristics: CharacteristicsDTO

    var body: some View {
        HStack(spacing: 0) {
            CharacteristicStackView(header: "Ld", value: characteristics.leadership)
            VerticalDivider()
        }
    }
}

private struct ModelSaveView: View {
    let characteristics: CharacteristicsDTO

    var body: some View {
        HStack(spacing: 0) {
            CharacteristicStackView(header: "Sv", value: characteristics.save)
        }
    }
}

private struct VerticalDivider: View {
    var body: some View {
        Divider()
        .frame(width: 1)
        .foregroundColor(.black)
    }
}

//#if DEBUG
//struct ModelCharacteristicsView_Previews: PreviewProvider {
//    static var previews: some View {
//        ModelCharacteristicsView()
//    }
//}
//#endif
