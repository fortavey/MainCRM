//
//  ChangeModerationStatusButton.swift
//  MainCRM
//
//  Created by Main on 15.03.2025.
//

import SwiftUI

struct ChangeModerationStatusButton: View {
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
                .frame(width: 100, height: 20)
                .padding(.horizontal, 5)
            }else {
                LineItemView(text: app.moderationStatus, width: width, color: Helpers().getItemColor(app: app))
            }
        }
        .buttonStyle(.plain)
        .sheet(isPresented: $isPresented) {
            ChangeModerationStatusSheet(isPresented: $isPresented, app: app)
        }

    }
}

struct ChangeModerationStatusSheet: View {
    @EnvironmentObject private var trustAccountsVM: TrustAccountsViewModel
    @EnvironmentObject private var appListVM: AppListViewModel
    @State private var moderationStatus: ModerationStatus = .created
    @Binding var isPresented: Bool
    
    var app: AppModel
    
    var body: some View {
        VStack{
            Text("Выберите статус модерации")
                .font(.title)
            ChooseModerationStatusView(moderationStatus: $moderationStatus)
            HStack{
                Button("Отмена") {
                    isPresented = false
                }
                Button("Сохранить") {
                    FirebaseServices().updateDocument(id: app.id, collection: "apps", fields: ["moderationStatus" : moderationStatus.rawValue]) { result in
                        if result {
                            appListVM.getAppsList()
                            isPresented = false
                        }else {
                            print("Ошибка обновления статуса модерации")
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
