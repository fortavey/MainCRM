//
//  AddCreoButton.swift
//  MainCRM
//
//  Created by Main on 17.03.2025.
//

import SwiftUI

struct AddCreoButton: View {
    @State private var isPresented: Bool = false
    var app: AppModel
    
    var body: some View {
        HStack{
            Button {
                isPresented = true
            } label: {
                ZStack{
                    LineItemView(text: "", width: 40)
                    Image(systemName: "plus.rectangle")
                }
            }
            .buttonStyle(.plain)
            .sheet(isPresented: $isPresented) {
                AddCreoSheet(isPresented: $isPresented, app: app)
            }
            if let creoLink = app.creoLink {
                if let link = URL(string: creoLink) {
                    if creoLink.matches("https"){
                        Link(destination: link) {
                            Image(systemName: "arrowshape.right.circle")
                                .resizable()
                                .frame(width: 17, height: 17)
                        }
                    }
                }
            }
        }

    }
}

struct AddCreoSheet: View {
    @EnvironmentObject private var appListVM: AppListViewModel
    @State private var creoLink: String = ""
    @Binding var isPresented: Bool
    var app: AppModel
    
    var body: some View {
        VStack{
            Text("Ссылка на креативы")
            TextField("Cсылка", text: $creoLink)
            HStack{
                Button("Отмена") { isPresented = false }
                Button("Сохранить"){
                    FirebaseServices().updateDocument(id: app.id, collection: "apps", fields: ["creoLink": creoLink]) { result in
                        if result {
                            appListVM.getAppsList()
                            isPresented = false
                        }else {
                            print("Ошибка обновления ссылки разработки")
                        }
                    }
                }
            }
            .padding()
        }
        .padding()

    }
}
