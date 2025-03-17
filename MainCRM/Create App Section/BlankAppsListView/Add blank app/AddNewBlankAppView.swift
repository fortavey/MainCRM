//
//  AddNewNewAppView.swift
//  MainCRM
//
//  Created by Main on 16.03.2025.
//


import SwiftUI
import FirebaseFirestore

struct AddNewBlankAppView: View {
    @State private var name = ""
    @State private var devLink = ""
        
    @Binding var isPresented: Bool
    
    @ObservedObject var blankAppsListVM: BlankAppsListViewModel
    
    
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
            
            TextField("Первое название", text: $name)
            TextField("Ссылка разработки", text: $devLink)
            Button {
                addNewApp()
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
        if name != "" && devLink != ""{
            return true
        }
        return false
    }
    
    private func addNewApp(){
        Firestore.firestore()
            .collection("newapps")
            .document()
            .setData([
                "name": name,
                "devLink": devLink,
            ], merge: true) { err in
                if err == nil {
                    print("Saved")
                    blankAppsListVM.getAppsList()
                    isPresented = false
                }else{
                    print("ERR", err)
                }
            }
    }
}
