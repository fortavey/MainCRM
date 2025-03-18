//
//  AppListView.swift
//  MainCRM
//
//  Created by Main on 08.03.2025.
//
import Foundation
import SwiftUI

struct AppListView: View {
    @EnvironmentObject private var appListVM: AppListViewModel
    @State private var isRemoveMode = false
    @State private var isLinkMode = false
    @State private var isCompMode = false
    @State private var isCreoMode = false
    @State private var isPresented = false
    @State private var isBanMode = false
    @State private var isSelfMode = false
    
    private func showBannedApp(app: AppModel) -> Bool{
        if isBanMode {
            return true
        }
        if app.isBan == true {
            return false
        }
        return true
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                AppListToolbar(
                    isRemoveMode: $isRemoveMode,
                    isLinkMode: $isLinkMode,
                    isCompMode: $isCompMode,
                    isCreoMode: $isCreoMode,
                    isPresented: $isPresented,
                    isBanMode: $isBanMode,
                    isSelfMode: $isSelfMode
                )
                
                List(sortAccountsByName().filter{showBannedApp(app: $0)}){ app in
                    ZStack{
                        HStack{
                            if isRemoveMode {
                                RemoveButtonView(title: app.firstAppName, id: app.id, collection: "apps") {
                                    appListVM.getAppsList()
                                }
                            }
                            if isBanMode {
                                AddBanButton(app: app)
                            }
                            if isCompMode {
                                LineItemView(text: app.devComp, width: 40)
                            }
                            LineItemView(text: app.firstAppName, width: 150)
                            // Ссылка на разработку
                            if isLinkMode {
                                DevelopmentsLinkView(app: app, itemWidth: 100)
                            }
                            // Трастовый аккаунт
                            ChangeTrustAccountButton(app: app, width: 100)
                            // Тип обновления приложения
                            ChangeUpdateTypeButton(app: app, width: 150)
                            // Статус модерации
                            ChangeModerationStatusButton(app: app, width: 100)
                            // Самофарм аккаунт
                            if isSelfMode {
                                ChangeSelfAccountButton(app: app, width: 100)
                            }
                            // Новое название приложения
                            NewAppNameButton(app: app, width: 150)
                            ZStack{
                                if app.localizations != nil {
                                    LocalizationButton(app: app)
                                }
                            }
                            .frame(width: 30)
                            
                            if isLinkMode {
                                let appNameLow = String(app.firstAppName.filter { !" \n\t\r".contains($0) }).lowercased()
                                let gpLink = "https://play.google.com/store/apps/details?id=com."
                                if let link = URL(string: gpLink + appNameLow) {
                                    Link(destination: link) {
                                        Image("GooglePlayIcon")
                                            .resizable()
                                            .frame(width: 17, height: 17)
                                    }
                                }
                            }
                            if isLinkMode {
                                if let link = URL(string: app.devLink) {
                                    if app.devLink.matches("https"){
                                        Link(destination: link) {
                                            Image("Github")
                                                .resizable()
                                                .frame(width: 17, height: 17)
                                        }
                                    }
                                }
                            }
                            if isLinkMode {
                                if let link = URL(string: app.driveLink) {
                                    if app.driveLink.matches("https"){
                                        Link(destination: link) {
                                            Image("GoogleDriveIcon")
                                                .resizable()
                                                .frame(width: 17, height: 17)
                                        }
                                    }
                                }
                            }
                            if isCreoMode {
                                AddCreoButton(app: app)
                            }
                            
                            Spacer()
                            
                            NavigationLink {
                                CreateNewTaskView(app: app)
                            } label: {
                                ZStack{
                                    HStack{
                                        Text("Создать задание")
                                        Image(systemName: "rectangle.center.inset.filled.badge.plus")
                                    }
                                }
                                .frame(width: 150, height: 20)
                                .background(Color.sectionBG)
                            }
                        } // Hstack
                        if app.isBan != nil && app.isBan == true{
                            HStack{
                                Spacer()
                            }
                            .frame(height: 1)
                            .background(Color.red)
                        }
                    } // Zstack
                }
            }
            .padding()
        }
    }
    
    private func sortAccountsByName() -> [AppModel]{
        return appListVM.appsList.sorted{
            
            return $0.firstAppName < $1.firstAppName
        }
    }
}


extension String {
    func matches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
}
