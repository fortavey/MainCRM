//
//  ChangeTrustAccountView.swift
//  MainCRM
//
//  Created by Main on 15.03.2025.
//

import SwiftUI

struct ChangeTrustAccountButton: View {
    var app: AppModel
    var width: CGFloat
    @State private var isPresented = false
    
    var body: some View {
        Button {
            isPresented = true
        } label: {
            LineItemView(text: app.createAccount, width: width)
        }
        .buttonStyle(.plain)
        .sheet(isPresented: $isPresented) {
            ChangeTrustAccountSheet(isPresented: $isPresented, app: app)
        }
    }
}


struct ChangeTrustAccountSheet: View {
    @EnvironmentObject private var trustAccountsVM: TrustAccountsViewModel
    @EnvironmentObject private var appListVM: AppListViewModel
    @State private var createAccount: String = ""
    @Binding var isPresented: Bool
    var app: AppModel
    
    var body: some View {
        VStack{
            Text("Выберите аккаунт")
                .font(.title)
            Picker(selection: $createAccount) {
                ForEach(trustAccountsVM.accountsList.indices) { index in
                    Button {
                        print("Аккаунт выбран")
                    } label: {
                        Text(getAccountName(index))
                    }
                    .tag(getAccountName(index))
                }
            } label: {
                HStack{
                    Text("Аккаунт")
                    Spacer()
                }
                .frame(width: 150)
            }
            HStack{
                Button("Отмена") {
                    isPresented = false
                }
                Button("Сохранить") {
                    FirebaseServices().updateDocument(id: app.id, collection: "apps", fields: ["createAccount" : createAccount]) { result in
                        if result {
                            appListVM.getAppsList()
                            isPresented = false
                        }else {
                            print("Ошибка обновления трастового аккаунта")
                        }
                    }
                }
                .disabled(createAccount == "")
            }
            .padding()
        }
        .padding()
    }
    
    private func getAccountName(_ index: Int) -> String {
        return trustAccountsVM.accountsList[index].alias
    }
}
