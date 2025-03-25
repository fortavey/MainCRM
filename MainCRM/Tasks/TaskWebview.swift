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
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isIndicator: Bool = false
    var app: AppModel
    
    var body: some View {
        Text("Создание боевой версии").font(.title2)
        if let linkString = app.creoLink {
            if let link = URL(string: linkString) {
                Link(destination: link) {
                    Image("GoogleDriveIcon")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
            }
        }
        
        Text(app.newAppName).font(.title3)
        Text(app.createAccount)
       
        
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
        
        if isIndicator {ProgressView()}
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
                "creoLink": app.creoLink ?? "",
                "webviewDomain": app.webviewDomain ?? "",
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
