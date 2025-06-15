//
//  TaskRename.swift
//  MainCRM
//
//  Created by Main on 18.03.2025.
//

import SwiftUI
import FirebaseFirestore

struct TaskRename: View {
    @EnvironmentObject private var tasksListVM: TasksListViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var app: AppModel
    @State private var isIndicator: Bool = false
    @State private var textForTextEditor: String = ""
    
    var body: some View {
        ScrollView {
            VStack{
                Text(app.firstAppName)
                    .font(.title)
                Text("com.\(String(app.firstAppName.filter { !" \n\t\r".contains($0) }).lowercased())")
                    .font(.title3)
                Text("Аккаунт - \(app.createAccount)")
                Text(app.updateType)
                Text(app.moderationStatus)
                
                Text("Переименовать в ")
                    .font(.title2)
                    .padding(.vertical, 10)
                
                Text(app.newAppName)
                    .font(.title)
                    .foregroundStyle(Color.green)
                
                HStack {
                    Button("11:00"){
                        createTimerTask(seconds: 3600)
                    }
                }
                
                VStack(alignment: .leading){
                    if let localizations = app.localizations {
                        ForEach(localizations.indices, id: \.self) { index in
                            Text(localizations[index])
                        }
                    }
                }
                
                Text("Ограничение по странам")
                    .font(.title2)
                    .padding(.vertical, 10)
                
                VStack(alignment: .leading){
                    if let countries = app.countries {
                        ForEach(countries.indices, id: \.self) { index in
                            Text(countries[index])
                        }
                    }
                }
                
                
                
                TextEditor(text: $textForTextEditor)
                    .frame(width: 500, height: 200)
                    .padding()
                
                let appNameLow = String(app.firstAppName.filter { !" \n\t\r".contains($0) }).lowercased()
                let gpLink = "https://play.google.com/store/apps/details?id=com."
                
                if let link = URL(string: gpLink + appNameLow) {
                    Link(destination: link) {
                        Image("GooglePlayIcon")
                            .resizable()
                            .frame(width: 17, height: 17)
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

            }
        }
    }
    
    private func sendCreateTaskRequest(){
        isIndicator = true
        Firestore.firestore()
            .collection("taskrename")
            .document(app.id)
            .setData([
                "firstAppName": app.firstAppName,
                "createAccount": app.createAccount,
                "moderationStatus": app.moderationStatus,
                "updateType": app.updateType,
                "newAppName": app.newAppName,
                "localizations": app.localizations ?? [],
                "countries": app.countries ?? [],
                "message": textForTextEditor,
                "isDone": false
            ], merge: true) { err in
                if err == nil {
                    print("Saved")
                    tasksListVM.getTasksRNList()
                    self.presentationMode.wrappedValue.dismiss()
                    isIndicator = false
                }else{
                    print("ERR")
                }
            }
    }
    
    private func createTimerTask(seconds: Int){
        isIndicator = true
        Firestore.firestore()
            .collection("timers")
            .document(app.id)
            .setData([
                "endTime": Int(Date().timeIntervalSince1970) + seconds,
                "isDone": false
            ], merge: true) { err in
                if err == nil {
                    print("Saved")
                    self.presentationMode.wrappedValue.dismiss()
                    isIndicator = false
                }else{
                    print("ERR")
                }
            }
    }
}
