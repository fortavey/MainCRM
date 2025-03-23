//
//  TaskCreo.swift
//  MainCRM
//
//  Created by Main on 18.03.2025.
//

import SwiftUI
import FirebaseFirestore

struct TaskCreo: View {
    @EnvironmentObject private var tasksListVM: TasksListViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var app: AppModel
    @State private var isIndicator: Bool = false
    @State private var textForTextEditor: String = ""
    
    var body: some View {
        Text(app.newAppName)
            .font(.title)
        Text("com.\(String(app.firstAppName.filter { !" \n\t\r".contains($0) }).lowercased())")
            .font(.title3)
        Text("Аккаунт - \(app.createAccount)")
        
        Text("Креативы добавить по локалям:")
            .padding(.vertical, 10)
            .font(.title3)
        
        VStack(alignment: .leading){
            if let localizations = app.localizations {
                ForEach(localizations.indices, id: \.self) { index in
                    Text(localizations[index])
                }
            }
        }
        
        TextEditor(text: $textForTextEditor)
            .frame(width: 500, height: 200)
            .padding()
        
        if let linkString = app.creoLink {
            if let link = URL(string: linkString) {
                Link(destination: link) {
                    Image(systemName: "link.icloud")
                        .resizable()
                        .frame(width: 35, height: 25)
                }
                
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
        }else {
            Text("Нет ссылки на креативы!")
                .font(.title3)
        }
       
    }
    
    private func sendCreateTaskRequest(){
        isIndicator = true
        Firestore.firestore()
            .collection(TaskDB.cr.rawValue)
            .document(app.id)
            .setData([
                "firstAppName": app.firstAppName,
                "createAccount": app.createAccount,
                "moderationStatus": app.moderationStatus,
                "updateType": app.updateType,
                "newAppName": app.newAppName,
                "localizations": app.localizations ?? [],
                "creoLink": app.creoLink ?? "",
                "message": textForTextEditor,
                "isDone": false
            ], merge: true) { err in
                if err == nil {
                    print("Saved")
                    tasksListVM.getTasksCRList()
                    self.presentationMode.wrappedValue.dismiss()
                    isIndicator = false
                }else{
                    print("ERR")
                }
            }
    }
}
