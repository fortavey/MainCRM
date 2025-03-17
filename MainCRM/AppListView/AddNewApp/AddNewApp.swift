//
//  AddNewApp.swift
//  MainCRM
//
//  Created by Main on 13.03.2025.
//

import SwiftUI
import FirebaseFirestore

struct AddNewApp: View {
    @State private var devComp: Comps = .mm1
    @State private var firstAppName = ""
    @State private var devLink = "not"
    @State private var createAccount = ""
    @State private var moderationStatus: ModerationStatus = .created
    @State private var updateType: UpdateType = .first
    @State private var moderationChangeTime = Date()
    @State private var newAppName = ""
    @State private var storeLink = ""
        
    @Binding var isPresented: Bool
    
    @ObservedObject var appListVM: AppListViewModel
    
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button {
                    isPresented = false
                } label: {
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                .buttonStyle(.plain)
            }

            Text("Добавить новое приложение")
                .padding()
                .font(.title)
            
            ChooseCompView(devComp: $devComp)
            TextField("Первое название", text: $firstAppName)
            TextField("Ссылка разработки", text: $devLink)
            ChooseAccountView(createAccount: $createAccount)
            ChooseUpdateTypeView(updateType: $updateType)
            ChooseModerationStatusView(moderationStatus: $moderationStatus)
            TextField("Новое название", text: $newAppName)
            TextField("Ссылка приложения", text: $storeLink)
                .toggleStyle(.checkbox)
            Button {
                addNewAccount()
            } label: {
                Text("Добавить")
                    .padding(5)
            }
            .padding(.top, 30)
            .disabled(!isValid())
            
            Spacer()
        }
        .frame(width: 500)
        .padding()
    }
    
    private func isValid() -> Bool{
        if firstAppName != "" && devLink != ""{
            return true
        }
        return false
    }
    
    private func addNewAccount(){
        Firestore.firestore()
            .collection("apps")
            .document()
            .setData([
                "devComp": devComp.rawValue,
                "firstAppName": firstAppName,
                "devLink": devLink,
                "createAccount": createAccount,
                "moderationStatus": moderationStatus.rawValue,
                "moderationChangeTime": moderationChangeTime,
                "updateStatus": updateType.rawValue,
                "newAppName": newAppName,
                "storeLink": storeLink
            ], merge: true) { err in
                if err == nil {
                    print("Saved")
                    appListVM.getAppsList()
                    isPresented = false
                }else{
                    print("ERR", err)
                }
            }
    }
}
