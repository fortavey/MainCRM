//
//  ChooseModerationView.swift
//  MainCRM
//
//  Created by Main on 13.03.2025.
//

import SwiftUI

enum ModerationStatus: String, CaseIterable {
    case created = "Подготовлено"
    case review =  "Модерация"
    case approve = "Одобрено"
    case reject = "Отклон"
}

struct ChooseModerationStatusView: View {
    @Binding var moderationStatus: ModerationStatus
    
    var body: some View {
        Picker(selection: $moderationStatus) {
            ForEach(ModerationStatus.allCases, id: \.rawValue) { status in
                Text(status.rawValue).tag(status)
            }
        }label: {
            HStack{
                Text("Статус модерации")
                Spacer()
            }
            .frame(width: 150)
        }
    }
}
