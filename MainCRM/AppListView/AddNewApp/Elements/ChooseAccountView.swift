//
//  ChooseAccountView.swift
//  MainCRM
//
//  Created by Main on 13.03.2025.
//

import SwiftUI

struct ChooseAccountView: View {
    @EnvironmentObject private var trustAccountsVM: TrustAccountsViewModel
    @Binding var createAccount: String
    
    var body: some View {
        Picker(selection: $createAccount) {
            ForEach(trustAccountsVM.accountsList.indices) { index in
                Text(getAccountName(index)).tag(getAccountName(index))
            }
        } label: {
            HStack{
                Text("Аккаунт")
                Spacer()
            }
            .frame(width: 150)
        }
    }
    
    private func getAccountName(_ index: Int) -> String {
        return trustAccountsVM.accountsList[index].alias
    }
}
