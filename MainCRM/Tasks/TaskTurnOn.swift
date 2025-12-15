//
//  TaskCreo.swift
//  MainCRM
//
//  Created by Main on 18.03.2025.
//

import SwiftUI
import FirebaseFirestore

struct TaskTurnOn: View {
    @EnvironmentObject private var tasksListVM: TasksListViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var app: AppModel
    @State private var isIndicator: Bool = false
    @State private var trackerLink: String = ""
    
    var body: some View {
        Text("Включение приложения " + app.newAppName + " (\(app.firstAppName))")
            .font(.title)
        Text("com.\(String(app.firstAppName.filter { !" \n\t\r".contains($0) }).lowercased())")
            .font(.title3)
        Text("Аккаунт Firebase - \(app.transferAccount ?? "NAN")")
        Text("Аккаунт локации - \(app.locationAccount ?? "NAN")")
        TextField("Ссылка трекера", text: $trackerLink)
            .frame(width: 300)
        
        if app.locationAccount != nil && trackerLink != "" && app.transferAccount != nil {
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
    
    private func sendCreateTaskRequest(){
        isIndicator = true
        
        if let transferAccount = app.transferAccount,
           let locationAccount = app.locationAccount {
            Firestore.firestore()
                .collection(TaskDB.to.rawValue)
                .document(app.id)
                .setData([
                    "firstAppName": app.firstAppName,
                    "newAppName": app.newAppName,
                    "firebaseAccount": transferAccount,
                    "locationAccount": locationAccount,
                    "trackerLink": trackerLink,
                    "isDone": false
                ], merge: true) { err in
                    if err == nil {
                        print("Saved")
                        tasksListVM.getTasksTOList()
                        self.presentationMode.wrappedValue.dismiss()
                        isIndicator = false
                    }else{
                        print("ERR")
                    }
                }
        }
        
    }
}
