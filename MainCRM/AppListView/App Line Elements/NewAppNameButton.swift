//
//  NewAppNameButton.swift
//  MainCRM
//
//  Created by Main on 15.03.2025.
//

import SwiftUI
import FirebaseFirestore

struct NewAppNameButton: View {
    var app: AppModel
    var width: CGFloat
    @State private var isPresented = false
    
    var body: some View {
        Button {
            isPresented = true
        } label: {
            LineItemView(text: app.newAppName + "\(app.isUACReady == true ? " - UAC" : "")", width: width)
        }
        .sheet(isPresented: $isPresented) {
            NewAppNameSheet(isPresented: $isPresented, app: app)
        }
        .buttonStyle(.plain)

    }
}

struct NewAppName: Identifiable {
    var id = UUID()
    var lang: Localizations
    var value: String
}

struct NewAppNameSheet: View {
    @EnvironmentObject private var brendListVM: BrendListViewModel
    @EnvironmentObject private var appListVM: AppListViewModel
    @State private var langs: [NewAppName] = []
    @State private var mainName = ""
    @State private var isBrendMode = false
    @Binding var isPresented: Bool
    var app: AppModel
    
    
    var body: some View {
        VStack{
            HStack {
                Button("Выбрать бренд"){ isBrendMode = true }
                Button("Ручной ввод"){ isBrendMode = false }
            }
            .padding()
            if isBrendMode {
                VStack{
                    Text("Выберите бренд")
                        .font(.title)
                    
                    List(brendListVM.brendsList, id: \.id){ brend in
                        Text(brend.name)
                    }
                    
                }
                .padding()
            }else {
                VStack{
                    Text("Введите новое название")
                        .font(.title)
                    Divider()
                    Text("Основное название")
                    TextField("Название приложения", text: $mainName)
                    Divider()
                    Text("Локальные названия")
                    
                    
                    ForEach($langs.wrappedValue){newAppName in
                        VStack{
                            HStack{
                                Text(newAppName.lang.title)
                                Text(" - ")
                                Text(newAppName.value)
                                Spacer()
                            }
                            Divider()
                        }
                    }
                    
                    AddLocaligationField(langs: $langs)
                    
                    HStack{
                        Button("Отмена") { isPresented = false }
                        Button("Сохранить") {
                            let localizationsArr = langs.map{ "\($0.lang.title) - \($0.value)" }
                            addNewAppName(id: app.id, newAppName: mainName, localizations: localizationsArr)
                        }
                    }
                    .padding()

                }
                .padding()
            }
        }
    }
    
    private func addNewAppName(id: String, newAppName: String, localizations: [String]){
        Firestore.firestore()
            .collection("apps")
            .document(id)
            .setData([
                "newAppName": newAppName,
                "localizations": localizations,
            ], merge: true) { err in
                if err == nil {
                    print("Saved")
                    appListVM.getAppsList()
                    isPresented = false
                }else{
                    print("ERR", err ?? "ERR")
                }
            }
    }
}

struct AddLocaligationField: View {
    @State private var value = ""
    @State private var lang: Localizations = .en
    @Binding var langs: [NewAppName]
    
    var body: some View {
        HStack {
            Picker("Язык", selection: $lang) {
                ForEach(Localizations.allCases, id: \.rawValue) { lang in
                    Text(lang.title).tag(lang)
                }
            }
            TextField("Название", text: $value)
            Button {
                var newName = NewAppName(lang: lang, value: value)
                langs.append(newName)
                value = ""
                lang = .en
            } label: {
                Image(systemName: "arrowshape.forward.fill")
            }

        }
    }
}
