//
//  ChooseUpdateStatusView.swift
//  MainCRM
//
//  Created by Main on 13.03.2025.
//

import SwiftUI

enum UpdateType: String, CaseIterable {
    case first = "Первая модерация"
    case naming = "Изменено название"
    case kreo = "Добавлены креативы"
    case webview = "Добавлено Webview"
    case ready = "Готово"
}

struct ChooseUpdateTypeView: View {
    @Binding var updateType: UpdateType
    
    var body: some View {
        Picker(selection: $updateType) {
            ForEach(UpdateType.allCases, id: \.rawValue) { type in
                Text(type.rawValue).tag(type)
            }
        }label: {
            HStack{
                Text("Тип обновления")
                Spacer()
            }
            .frame(width: 150)
        }
    }
}
