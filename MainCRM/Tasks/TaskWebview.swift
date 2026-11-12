//
//  TaskWebview.swift
//  MainCRM
//
//  Created by Main on 24.03.2025.
//

import SwiftUI
import FirebaseFirestore

struct TaskWebview: View {
    @EnvironmentObject private var tasksListVM: TasksListViewModel
    @EnvironmentObject private var brendsVM: BrendsViewModel
    @EnvironmentObject private var trustVM: TrustAccountsViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isIndicator: Bool = false
    @State private var isValid: Bool = false
    @State private var creoLink: String = ""
    @State private var domainLink: String = ""
    var app: AppModel
    
    var body: some View {
        Text("Создание боевой версии").font(.title2)
        Picker("Компьютер", selection: $tasksListVM.comp) {
            ForEach(CompsEnum.allCases, id: \.self) { comp in
                Text(comp.rawValue).tag(comp)
            }
        }
        .frame(width: 220)
        .disabled(isIndicator)
        if let link = URL(string: creoLink) {
            Link(destination: link) {
                Image("GoogleDriveIcon")
                    .resizable()
                    .frame(width: 25, height: 25)
            }
        }
        
        Text(app.newAppName).font(.title3)
        Text(app.createAccount)
            .onAppear{
                let link = self.getCreoLink()
                let domLink = self.getDomainLink()
                if link == "" || domLink == "" {
                    isValid = false
                }else {
                    creoLink = link
                    domainLink = domLink
                    isValid = true
                }
            }
       
        if isValid {
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
        }else {
            Text(creoLink == "" ? "Нет ссылки на креативы" : "Нет домена для ссыылки вебвью")
        }
        
        if isIndicator {ProgressView()}
    }
    
    private func getCreoLink() -> String {
        guard let brend = brendsVM.brendsList.first(where: { $0.name.lowercased() == app.newAppName.lowercased() }) else {return ""}
        return brend.creoLink
    }
    
    private func getDomainLink() -> String {
        guard let acc = trustVM.accountsList.first(where: { $0.alias.lowercased() == app.createAccount.lowercased() }) else {return ""}
        return acc.domain
    }
    
    private func sendCreateTaskRequest(){
        isIndicator = true
        Firestore.firestore()
            .collection(TaskDB.web.rawValue)
            .document(app.id)
            .setData([
                "appId": "com.\(String(app.firstAppName.filter { !" \n\t\r".contains($0) }).lowercased())",
                "firstAppName": app.firstAppName,
                "newAppName": app.newAppName,
                "createAccount": app.createAccount,
                "transferAccount": app.transferAccount ?? "",
                "creoLink": creoLink,
                "domainLink": domainLink,
                "devLink": app.driveLink,
                "webviewDomain": app.webviewDomain ?? "",
                "devComp": tasksListVM.comp.rawValue,
                "isDone": false
            ], merge: true) { err in
                if err == nil {
                    print("Saved")
                    tasksListVM.getTasksWEBList()
                    self.presentationMode.wrappedValue.dismiss()
                    isIndicator = false
                }else{
                    print("ERR")
                }
            }
    }
}
