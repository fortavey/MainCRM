//
//  ChangeUpdateType.swift
//  MainCRM
//
//  Created by Main on 15.03.2025.
//

import SwiftUI

struct ChangeUpdateTypeButton: View {
    var app: AppModel
    var width: CGFloat
    @State private var isPresented = false
    
    var body: some View {
        Button {
            isPresented = true
        } label: {
            if app.updateType == "Готово" {
                ZStack {
                    Image(systemName: "checkmark.diamond")
                        .foregroundStyle(Color.green)
                }
                .frame(width: 150, height: 20)
                .padding(.horizontal, 5)
            }else {
                LineItemView(text: app.updateType, width: 150, color: Helpers().getItemColor(app: app))
            }
        }
        .buttonStyle(.plain)
        .sheet(isPresented: $isPresented) {
            ChangeUpdateTypeSheet(isPresented: $isPresented, app: app)
        }
    }
}


struct ChangeUpdateTypeSheet: View {
    @EnvironmentObject private var trustAccountsVM: TrustAccountsViewModel
    @EnvironmentObject private var appListVM: AppListViewModel
    @State private var updateType: UpdateType = .first
    @Binding var isPresented: Bool
    
    var app: AppModel
    
    var body: some View {
        VStack{
            Text("Выберите тип обновления")
                .font(.title)
            ChooseUpdateTypeView(updateType: $updateType)
            HStack{
                Button("Отмена") {
                    isPresented = false
                }
                Button("Сохранить") {
                    FirebaseServices().updateDocument(id: app.id, collection: "apps", fields: ["updateStatus" : updateType.rawValue]) { result in
                        if result {
                            appListVM.getAppsList()
                            isPresented = false
                        }else {
                            print("Ошибка обновления типа модерации")
                        }
                    }
                }
            }
            .padding()
        }
        .padding()
    }
    
    private func getAccountName(_ index: Int) -> String {
        return trustAccountsVM.accountsList[index].alias
    }
}

