//
//  TaskAsoMobile.swift
//  MainCRM
//
//  Created by Main on 22.03.2025.
//

import SwiftUI
import FirebaseFirestore

struct LocalUpdate: View {
    @EnvironmentObject private var appListVM: AppListViewModel
    @EnvironmentObject private var tasksListVM: TasksListViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isIndicator: Bool = false
    @State private var textForTextEditor: String = ""
    @State private var keys: [String] = []
    @State private var isHandle: Bool = false
    var app: AppModel
    
    var body: some View {
        
        HStack{
            Button {
                guard let countries = app.countries else {return}
                countries.forEach { keys.append("\($0) - \(app.newAppName)") }
            } label: {
                Text("Заполнить по умолчанию")
            }
            
            Button {
                isHandle = true
            } label: {
                Text("Заполнить Вручную")
            }
        }
        
        if isHandle {
            AddKeyHandle(keys: $keys, app: app)
        }

        ForEach(keys.indices, id: \.self) { index in
            Text(keys[index])
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
    
    private func sendCreateTaskRequest(){
        isIndicator = true
        Firestore.firestore()
            .collection(TaskDB.lo.rawValue)
            .document(app.id)
            .setData([
                "appLink": "https://play.google.com/store/apps/details?id=com.\(String(app.firstAppName.filter { !" \n\t\r".contains($0) }).lowercased())",
                "keys": keys,
                "isDone": false
            ], merge: true) { err in
                if err == nil {
                    changeAsoMobileStatus()
                    tasksListVM.getTasksTOList()
                    self.presentationMode.wrappedValue.dismiss()
                    isIndicator = false
                }else{
                    print("ERR")
                }
            }
    }
    
    private func changeAsoMobileStatus(){
        FirebaseServices().updateDocument(id: app.id,
                                          collection: "apps",
                                          fields: ["isAsoMobile" : false]) { result in
            if result {
                appListVM.getAppsList()
            }else {
                print("Ошибка обновления трастового аккаунта")
            }
        }
    }
}


struct AddKeyHandle: View {
    @Binding var keys: [String]
    @State private var country: Countries = .AM
    @State private var key: String = ""
    var app: AppModel
    
    var body: some View {
        HStack{
            Picker(selection: $country) {
                ForEach(Countries.allCases, id: \.rawValue) { c in
                    Text(c.rawValue).tag(c)
                }
            }label: {
                Text("")
            }
            TextField("Ключ", text: $key)
            Button("Добавить") {
                if keys.contains("\(country.rawValue) - \(app.newAppName)"){
                    var newArr = keys.filter{ $0 != "\(country.rawValue) - \(app.newAppName)"}
                    newArr.append("\(country.rawValue) - \(key)")
                    keys = newArr
                }else {
                    keys.append("\(country.rawValue) - \(key)")
                }
                country = .AM
                key = ""
            }
        }
        .frame(width: 500)
    }
}
