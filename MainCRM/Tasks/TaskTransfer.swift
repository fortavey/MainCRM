//
//  TaskTransfer.swift
//  MainCRM
//
//  Created by Main on 22.03.2025.
//

import SwiftUI
import FirebaseFirestore

struct AccountInfo {
    var name: String
    var company: String
    var identifier: String
    var token: String
}

struct TaskTransfer: View {
    @EnvironmentObject private var tasksListVM: TasksListViewModel
    @EnvironmentObject private var trustAccountsVM: TrustAccountsViewModel
    @EnvironmentObject private var selfAccountsVM: SelfAccountsViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isIndicator: Bool = false
    @State private var createAccountName = ""
    @State private var transferAccountName = ""
    var app: AppModel
    
    var body: some View {
        VStack{
            Text("Трансфер приложения \(app.newAppName)")
                .font(.title)
                .padding()
            
            HStack{
                Text(app.createAccount)
                Image(systemName: "arrowshape.forward")
                    .foregroundStyle(.green)
                Text(app.transferAccount ?? "Нет аккаунта")
            }
            
            if app.transferAccount != nil {
                Button {
                    sendCreateTaskRequest()
                } label: {
                    HStack{
                        Text("Создать задачу")
                        Image(systemName: "arrowshape.forward")
                    }
                }
                .frame(height: 35)
                .padding(.horizontal, 15)
            }
            
            
            if isIndicator {ProgressView()}
        }
    }
    
    private func getAccountInfo(accountName: String) -> AccountInfo? {
        if let account = trustAccountsVM.accountsList.first(where: {$0.alias == accountName}) {
            return AccountInfo(
                name: account.alias,
                company: account.company,
                identifier: account.developerId,
                token: account.transactionId
            )
        } else if let account = selfAccountsVM.accountsList.first(where: {$0.alias == accountName}) {
            return AccountInfo(
                name: account.alias,
                company: account.company,
                identifier: account.developerId,
                token: account.transactionId
            )
        }
        
        return nil
    }
    
    private func sendCreateTaskRequest(){
        isIndicator = true
        guard let tarnsferAccName = app.transferAccount else { return }
        guard let createAcc = getAccountInfo(accountName: app.createAccount) else { return }
        guard let transferAcc = getAccountInfo(accountName: tarnsferAccName) else { return }
        
        Firestore.firestore()
            .collection(TaskDB.tr.rawValue)
            .document(app.id)
            .setData([
                "appId": "com.\(String(app.firstAppName.filter { !" \n\t\r".contains($0) }).lowercased())",
                "createAccountName": createAcc.name,
                "createAccountCompany": createAcc.company,
                "createAccountIdentifier": createAcc.identifier,
                "createAccountToken": createAcc.token,
                "transferAccountName": transferAcc.name,
                "transferAccountCompany": transferAcc.company,
                "transferAccountIdentifier": transferAcc.identifier,
                "transferAccountToken": transferAcc.token,
                "isDone": false
                
            ], merge: true) { err in
                if err == nil {
                    print("Saved")
                    tasksListVM.getTasksTRList()
                    self.presentationMode.wrappedValue.dismiss()
                    isIndicator = false
                }else{
                    print("ERR")
                }
            }
    }
}


struct AccountInfoView: View {
    var account: AccountInfo
    
    var body: some View {
        Text("AccountInfoView")
    }
}
