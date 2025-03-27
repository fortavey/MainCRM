//
//  ChangeSelfAccountButton.swift
//  MainCRM
//
//  Created by Main on 18.03.2025.
//

import SwiftUI

struct ChangeSelfAccountButton: View {
    @EnvironmentObject private var appListVM: AppListViewModel
    var app: AppModel
    var width: CGFloat
    @State private var isPresented = false
    
    var body: some View {
        HStack{
            TransferMoveView(app: app)
            
            Button {
                isPresented = true
            } label: {
                LineItemView(text: app.transferAccount ?? "", width: width)
            }
            .buttonStyle(.plain)
            .sheet(isPresented: $isPresented) {
                ChangeSelfAccountSheet(isPresented: $isPresented, app: app)
            }
            
            TransferDoneView(app: app)
        }
    }
}


struct ChangeSelfAccountSheet: View {
    @EnvironmentObject private var selfAccountsVM: SelfAccountsViewModel
    @EnvironmentObject private var appListVM: AppListViewModel
    @State private var transferAccount: String = ""
    @Binding var isPresented: Bool
    var app: AppModel
    
    var body: some View {
        VStack{
            Text("Выберите аккаунт")
                .font(.title)
            Picker(selection: $transferAccount) {
                ForEach(selfAccountsVM.accountsList.indices) { index in
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
                    FirebaseServices().updateDocument(id: app.id, collection: "apps", fields: ["transferAccount" : transferAccount]) { result in
                        if result {
                            appListVM.getAppsList()
                            isPresented = false
                        }else {
                            print("Ошибка обновления трастового аккаунта")
                        }
                    }
                }
                .disabled(transferAccount == "")
            }
            .padding()
        }
        .padding()
    }
    
    private func getAccountName(_ index: Int) -> String {
        return selfAccountsVM.accountsList[index].alias
    }
}


struct TransferMoveView: View {
    @EnvironmentObject private var appListVM: AppListViewModel
    var app: AppModel
    
    var body: some View {
        if app.isTransfer == nil {
            if app.transferAccount != nil {
                Button("+"){
                    FirebaseServices().updateDocument(id: app.id, collection: "apps", fields: ["isTransfer" : false]) { result in
                        if result {
                            appListVM.getAppsList()
                        }else {
                            print("Ошибка обновления")
                        }
                    }
                }
                .frame(width: 30)
            }else {
                Button(" "){}
                    .buttonStyle(.plain)
                    .frame(width: 30)
            }
        }else {
            if !app.isTransfer! {
                Button{
                    
                }label: {
                    Image(systemName: "arrowshape.right").foregroundStyle(.green)
                }
                .buttonStyle(.plain)
                .frame(width: 30)
            }else {
                Button(" "){}
                    .buttonStyle(.plain)
                    .frame(width: 30)
            }
        }
    }
}

struct TransferDoneView: View {
    @EnvironmentObject private var appListVM: AppListViewModel
    var app: AppModel
    
    var body: some View {
        if let isTransfer = app.isTransfer, !isTransfer {
            Button{
                FirebaseServices().updateDocument(id: app.id, collection: "apps", fields: ["isTransfer" : true]) { result in
                    if result {
                        appListVM.getAppsList()
                    }else {
                        print("Ошибка обновления")
                    }
                }
            } label: {
                Image(systemName: "checkmark.seal")
            }
            .frame(width: 30)
        }else {
            if app.isTransfer != nil {
                Button{
                    
                }label: {
                    Image(systemName: "checkmark.seal").foregroundStyle(.green)
                }
                .buttonStyle(.plain)
                .frame(width: 30)
            }else {
                Button(" "){}
                    .buttonStyle(.plain)
                    .frame(width: 30)
            }
        }
    }
}
