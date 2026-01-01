//
//  AddNewNewAppView.swift
//  MainCRM
//
//  Created by Main on 16.03.2025.
//


import SwiftUI
import FirebaseFirestore

struct AddNewBlankAppView: View {
    @Binding var isPresented: Bool
    @State private var namesArray: [String] = []
    
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

            Text("Добавить новые приложения")
                .padding()
                .font(.title)
            
            Button("Собрать") {
                do {
                    var zips = try FileManager.default.contentsOfDirectory(atPath: "/Users/Main/NewApps")
                    zips = zips.filter{ $0 != ".DS_Store" }
                    zips = zips.map{
                        $0.replacingOccurrences(of: ".zip", with: "")
                    }
                    namesArray = zips
                }catch {
                    
                }
            }
            
            Divider()
            
            ScrollView{
                ForEach(namesArray, id: \.self) { appName in
                    AddAppItemView(namesArray: $namesArray, name: appName)
                    Divider()
                }
                Button("Получить список для Дизайнера"){
                    var listString = ""
                    blankAppsListVM.appsList.forEach{
                        listString += "\($0.driveLink)\n\n"
                    }
                    copyText(text: listString)
                }
            }
            
            Spacer()
        }
        .frame(width: 500)
        .padding()
    }
    
    func copyText(text: String){
        let pasteboard = NSPasteboard.general
        pasteboard.declareTypes([NSPasteboard.PasteboardType.string], owner: nil)
        pasteboard.setString(text, forType: .string)
    }
}
