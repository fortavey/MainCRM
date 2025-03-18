//
//  DevelopmentsLinkView.swift
//  MainCRM
//
//  Created by Main on 15.03.2025.
//

import SwiftUI

struct DevelopmentsLinkView: View {
    @EnvironmentObject private var appListVM: AppListViewModel
    @State private var showingAlert = false
    @State private var newLink = ""
    var app: AppModel
    var itemWidth: CGFloat
    
    var body: some View {
        HStack{
            Button {
                showingAlert = true
            } label: {
                LineItemView(text: app.devLink, width: itemWidth)
            }
            .buttonStyle(.plain)
            .alert("Ссылка на разработку", isPresented: $showingAlert ) {
                VStack{
                    TextField("Ссылка", text: $newLink)
                    HStack{
                        Button("Добавить") {
                            FirebaseServices().updateDocument(id: app.id, collection: "apps", fields: ["devLink": newLink]) { result in
                                if result {
                                    appListVM.getAppsList()
                                    showingAlert = false
                                }else {
                                    print("Ошибка обновления ссылки разработки")
                                }
                            }
                        }
                        Button("Отмена", role: .cancel) { showingAlert = false }
                    }
                }
            } message: {
                Text("Вставьте ссылку")
            }
        }
    }
}
