//
//  AccBanButton.swift
//  MainCRM
//
//  Created by Main on 15.04.2025.
//

import SwiftUI

struct AccBanButton: View {

    @EnvironmentObject private var trustAccountsVM: TrustAccountsViewModel
    var acc: TrustAccountModel
        
        var body: some View {
            Button {
                FirebaseServices().updateDocument(id: acc.id, collection: "trust", fields: ["isBan": appBanToggle()]) { result in
                    if result {
                        trustAccountsVM.getAccountsList()
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
            guard let isBan = acc.isBan else { return Color.white }
            return isBan ? Color.red : Color.white
        }
        
        private func appBanToggle() -> Bool {
            if let isBan = acc.isBan {
                return !isBan
            }else {
                return true
            }
        }
    }
