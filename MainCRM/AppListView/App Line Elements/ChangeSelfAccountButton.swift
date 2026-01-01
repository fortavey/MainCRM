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
    @State private var isPresentedTransfer = false
    @State private var isPresentedLocation = false
    
    var body: some View {
        HStack{
            TransferMoveView(app: app)
            
            // Firebase account
            Button {
                isPresentedTransfer = true
            } label: {
                LineItemView(text: app.transferAccount ?? "", width: width, icon: "FirebaseIcon")
            }
            .buttonStyle(.plain)
            .sheet(isPresented: $isPresentedTransfer) {
                ChangeSelfAccountSheet(isPresented: $isPresentedTransfer, app: app, accountType: "transferAccount")
            }
            
            // Location account
            Button {
                isPresentedLocation = true
            } label: {
                LineItemView(text: app.locationAccount ?? "", width: width, icon: "GooglePlayIcon")
            }
            .buttonStyle(.plain)
            .sheet(isPresented: $isPresentedLocation) {
                ChangeSelfAccountSheet(isPresented: $isPresentedLocation, app: app, accountType: "locationAccount")
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
    var accountType: String
    
    func getEmptyAccountsList() -> [String] {
        var returnArr: [String] = []
        selfAccountsVM.accountsList.forEach{ acc in
            if acc.alias == "S.FARM-1" { returnArr.append("S.FARM-1") }
            else {
                if !appListVM.appsList.contains(where: { $0.transferAccount == acc.alias }) {
                    returnArr.append(acc.alias)
                }else {
                    if accountType == "locationAccount" {
                        returnArr.append(acc.alias)
                    }
                }
            }
            
        }
        
        return returnArr
    }
    
    var body: some View {
        VStack{
            Text("Выберите аккаунт")
                .font(.title)
            TextField("Введите алиас аккаунта", text: $transferAccount)
            Picker(selection: $transferAccount) {
                ForEach(getEmptyAccountsList(), id: \.self) { accAlias in
                    Button {
                        print("Аккаунт выбран")
                    } label: {
                        Text(accAlias)
                    }
                    .tag(accAlias)
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
                    print(accountType)
                    isPresented = false
                }
                Button("Сохранить") {
                    FirebaseServices().updateDocument(id: app.id, collection: "apps", fields: [accountType : transferAccount]) { result in
                        if result {
                            appListVM.getAppsList()
                            isPresented = false
                        }else {
                            print("Ошибка обновления аккаунта")
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
    
    func getButtonColor() -> Color {
        var appsWithSameAccount: [AppModel] = appListVM.appsList.filter { $0.createAccount == app.createAccount }
        
        var isSomeAppHaveActiveTransfer: [AppModel] = appsWithSameAccount.filter{ $0.isTransfer == false }

        if isSomeAppHaveActiveTransfer.isEmpty {
            return .red
        }else {
            return .clear
        }
    }
    
    var body: some View {
        if app.isTransfer == nil {
            if app.transferAccount != nil {
                Button("+"){
                    FirebaseServices()
                        .updateDocument(id: app.id,
                                        collection: "apps",
                                        fields: [
                                            "isTransfer" : false,
                                            "moderationChangeTime" : Int(Date().timeIntervalSince1970)
                                        ]
                        ) { result in
                        if result {
                            appListVM.getAppsList()
                        }else {
                            print("Ошибка обновления")
                        }
                    }
                }
                .frame(width: 30)
                .background(getButtonColor())
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
