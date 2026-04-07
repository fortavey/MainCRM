//
//  ChangeTrustAccountView.swift
//  MainCRM
//
//  Created by Main on 15.03.2025.
//

import SwiftUI

struct ChangeTrustAccountButton: View {
    @EnvironmentObject private var trustAccountsVM: TrustAccountsViewModel
    var app: AppModel
    var width: CGFloat
    @State private var isPresented = false
    
    var body: some View {
        Button {
            isPresented = true
        } label: {
            LineItemView(text: getAccountAlias(alias: app.createAccount), width: width)
        }
        .buttonStyle(.plain)
        .sheet(isPresented: $isPresented) {
            ChangeTrustAccountSheet(isPresented: $isPresented, app: app)
        }
    }
    
    func getAccountAlias(alias: String) -> String {
        let accList = trustAccountsVM.accountsList.filter{ $0.isBan != true }.filter{ $0.alias == alias }
        
        if alias.contains("S.FARM"){
            return alias
        }
        if accList.isEmpty {
            return ""
        }else if let isTransferError = accList[0].isTransferError {
            return "\(alias) !!!"
        }else {
            return alias
        }
    }
}


struct ChangeTrustAccountSheet: View {
    @EnvironmentObject private var trustAccountsVM: TrustAccountsViewModel
    @EnvironmentObject private var appListVM: AppListViewModel
    @State private var createAccount: String = ""
    @Binding var isPresented: Bool
    var app: AppModel
    
    func getAccountsList() -> [TrustAccountModel] {
        return trustAccountsVM.accountsList.filter{ $0.isBan != true }
    }
    
    func getAccountAlias(acc: TrustAccountModel) -> String {
        if let isTransferError = acc.isTransferError {
            return "\(acc.alias) !!!"
        }else {
            return acc.alias
        }
    }
    
    var body: some View {
        VStack{
            Text("Выберите аккаунт")
                .font(.title)
            TextField("Введите алиас аккаунта", text: $createAccount)
            Picker(selection: $createAccount) {
                ForEach(getAccountsList(), id: \.id) { acc in
                    Button {
                        print("Аккаунт выбран")
                    } label: {
                        Text(getAccountAlias(acc: acc))
                    }
                    .tag(acc.alias)
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
}
