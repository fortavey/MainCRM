//
//  AddBanButton.swift
//  MainCRM
//
//  Created by Main on 17.03.2025.
//

import SwiftUI

struct AddBanButton: View {
    @EnvironmentObject private var appListVM: AppListViewModel
    var app: AppModel
    
    var body: some View {
        Button {
            FirebaseServices().updateDocument(id: app.id, collection: "apps", fields: ["isBan": appBanToggle()]) { result in
                if result {
                    appListVM.getAppsList()
                }else {
                    print("Ошибка обновления ссылки разработки")
                }
            }
        } label: {
            Image(systemName: "circle.slash")
                .foregroundStyle(getIconColor())
        }
    }
    
    private func getIconColor() -> Color {
        guard let isBan = app.isBan else { return Color.white }
        return isBan ? Color.red : Color.white
    }
    
    private func appBanToggle() -> Bool {
        if let isBan = app.isBan {
            return !isBan
        }else {
            return true
        }
    }
}
