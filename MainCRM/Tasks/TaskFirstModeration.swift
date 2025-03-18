//
//  TaskFirstModeration.swift
//  MainCRM
//
//  Created by Main on 18.03.2025.
//

import SwiftUI
import FirebaseFirestore

struct TaskFirstModeration: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var app: AppModel
    @State private var isIndicator: Bool = false
    
    var body: some View {
        Text(app.firstAppName)
            .font(.title)
        Text("Аккаунт - \(app.createAccount)")
        Text(app.updateType)
        Text(app.moderationStatus)
        if let link = URL(string: app.driveLink) {
            Link(destination: link) {
                Image(systemName: "link.icloud")
                    .resizable()
                    .frame(width: 35, height: 25)
            }
            
            if app.createAccount != "" {
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
    
    private func sendCreateTaskRequest(){
        isIndicator = true
        Firestore.firestore()
            .collection("taskfirsmoderation")
            .document()
            .setData([
                "appId":app.id,
                "firstAppName": app.firstAppName,
                "createAccount": app.createAccount,
                "moderationStatus": app.moderationStatus,
                "updateType": app.updateType,
                "driveLink": app.driveLink,
                "isDone": false
            ], merge: true) { err in
                if err == nil {
                    print("Saved")
                    self.presentationMode.wrappedValue.dismiss()
                    isIndicator = false
                }else{
                    print("ERR", err)
                }
            }
    }
}
