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
    @State private var driveLink = ""
        
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
            HStack{
                TextField("Ссылка исходников", text: $driveLink)
                if let link = URL(string: "https://drive.google.com/drive/folders/1O38VJSDx0fM1y3yv5G_TznKnhTI8pQlO") {
                    Link(destination: link) {
                        Image("GoogleDriveIcon")
                            .resizable()
                            .frame(width: 17, height: 17)
                    }
                }
            }
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
        if name != "" && devLink != "" && driveLink != "" {
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
                "driveLink": driveLink
            ], merge: true) { err in
                if err == nil {
                    print("Saved")
                    blankAppsListVM.getAppsList()
                    isPresented = false
                }else{
                    print("ERR")
                }
            }
    }
}
