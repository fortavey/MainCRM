//
//  AddAppItemView.swift
//  MainCRM
//
//  Created by Main on 18.12.2025.
//

import SwiftUI
import FirebaseFirestore

struct AddAppItemView: View { 
    @State private var devLink = ""
    @State private var driveLink = ""
    @State private var showButton: Bool = true
    @Binding var namesArray: [String]
    var name: String
    
    var body: some View {
        VStack{
            HStack{
                CopyTextView(text: name)
                    .frame(width: 150)
                Button("Открыть папку"){
                    openFinder(at: "/Users/Main/NewApps/\(name).zip")
                }
            }
            TextField("Ссылка исходников", text: $driveLink)
            TextField("Ссылка разработки", text: $devLink)
            
            Button {
                addNewApp()
            } label: {
                Text("Добавить")
                    .padding(5)
            }
            .disabled(!isValid())
        }
    }
    
    func removeItem(){
        namesArray = namesArray.filter{ $0 != name }
    }
    
    func openFinder(at path: String) {
        let url = URL(fileURLWithPath: path)
        NSWorkspace.shared.activateFileViewerSelecting([url])
    }
    
    private func isValid() -> Bool{
        if name != "" && devLink != "" && driveLink.matches("https://drive.google.com/drive/folders") {
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
                    removeItem()
                }else{
                    print("ERR")
                }
            }
    }
}
