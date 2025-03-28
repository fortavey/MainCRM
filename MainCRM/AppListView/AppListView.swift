//
//  AppListView.swift
//  MainCRM
//
//  Created by Main on 08.03.2025.
//
import Foundation
import SwiftUI

enum SortingType: String, CaseIterable {
    case firstAppName = "Первое название"
    case newAppName = "Новое название"
    case createAccount = "Аккаунт создания"
    case devComp = "Компьютер"
    case updateType = "Тип обновления"
}

struct AppListView: View {
    @EnvironmentObject private var appListVM: AppListViewModel
    @EnvironmentObject private var tasksListVM: TasksListViewModel
    @State private var isRemoveMode = false
    @State private var isPlayStoreMode = true
    @State private var isLinkMode = false
    @State private var isCompMode = false
    @State private var isCreoMode = false
    @State private var isPresented = false
    @State private var isBanMode = false
    @State private var isSelfMode = false
    @State private var isWebviewMode = false
    
    @State private var sortingType: SortingType = .updateType
    
    var body: some View {
        NavigationStack {
            VStack {
                AppListToolbar(
                    isRemoveMode: $isRemoveMode,
                    isLinkMode: $isLinkMode,
                    isPlayStoreMode: $isPlayStoreMode,
                    isCompMode: $isCompMode,
                    isCreoMode: $isCreoMode,
                    isPresented: $isPresented,
                    isBanMode: $isBanMode,
                    isSelfMode: $isSelfMode,
                    isWebviewMode: $isWebviewMode
                )
                
                    
                HStack{
                    Spacer()
                    Menu {
                        ForEach(SortingType.allCases, id: \.rawValue) { type in
                            Button(type.rawValue){ sortingType = type }
                        }
                    } label: {
                        Text(sortingType.rawValue)
                    }
                    .frame(width: 150)
                }
                
                List(sortingList().filter{showBannedApp(app: $0)}){ app in
                    ZStack{
                        HStack{
                            // Кнопка удаления
                            if isRemoveMode {
                                RemoveButtonView(title: app.firstAppName, id: app.id, collection: "apps") {
                                    appListVM.getAppsList()
                                }
                            }
                            
                            // Кнопка бана
                            if isBanMode {
                                AddBanButton(app: app)
                            }
                            
                            // Компьютер
                            if isCompMode {
                                LineItemView(text: app.devComp, width: 40)
                            }
                            
                            // Первое название
                            LineItemView(text: app.firstAppName, width: 150)
                            
                            // Трастовый аккаунт
                            ChangeTrustAccountButton(app: app, width: 100)
                            // Тип обновления приложения
                            ChangeUpdateTypeButton(app: app, width: 150)
                            // Статус модерации
                            ChangeModerationStatusButton(app: app, width: 100)
                            
                            // Время после изменения статуса модерации
                            ZStack{
                                Text(Helpers().getTimeCount(timestamp: app.moderationChangeTime))
                            }
                            .frame(width: 40, height: 25)
                            .background(Color.sectionBG)
                            
                            // Самофарм аккаунт
                            if isSelfMode {
                                ChangeSelfAccountButton(app: app, width: 100)
                            }
                            // Новое название приложения
                            NewAppNameButton(app: app, width: 150)
                            ZStack{
                                if let local = app.localizations {
                                    if local.count > 0 {
                                        LocalizationButton(app: app)
                                    }
                                }
                            }
                            .frame(width: 30)
                            
                            // Страны
                            ChooseCountryButtonView(app: app)
                            
                            // ASO Mobile
                            if app.updateType == UpdateType.naming.rawValue && app.moderationStatus == ModerationStatus.approve.rawValue {
                                if app.isAsoMobile == nil || !app.isAsoMobile! {
                                    Button("+АСО"){
                                        FirebaseServices().updateDocument(id: app.id,
                                                                          collection: "apps",
                                                                          fields: ["isAsoMobile" : true]) { result in
                                            if result {
                                                appListVM.getAppsList()
                                            }else {
                                                print("Ошибка обновления трастового аккаунта")
                                            }
                                        }
                                    }
                                }
                            }
                            
                            
                            
                            // Домен webview
                            if isWebviewMode {
                                LineItemView(text: app.webviewDomain ?? "", width: 250)
                            }
                            
                            // Ссылка на приложение в GooglePlay
                            if isPlayStoreMode {
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
                            
                            // Cсылка на исходники разработки
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
                            
                            // Cсылка на исходники для первой модерации
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
                            
                            // Креативы
                            if isCreoMode {
                                AddCreoButton(app: app)
                            }
                            
                            Spacer()
                            
                            
                            // Задачи
                            TasksAppLineElement(app: app)
                            
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
    
    private func sortingList() -> [AppModel]{
        return appListVM.appsList.sorted{ sortAppsBy(app1: $0, app2: $1) }
    }
    
    func sortAppsBy(app1: AppModel, app2: AppModel) -> Bool {
        switch sortingType {
        case .firstAppName:
            return app1.firstAppName < app2.firstAppName
        case .newAppName:
            return app1.newAppName < app2.newAppName
        case .createAccount:
            return app1.createAccount < app2.createAccount
        case .devComp:
            return app1.devComp < app2.devComp
        case .updateType:
            return app1.updateType < app2.updateType
        }
    }
    
    private func sortAccountsByName() -> [AppModel]{
        return appListVM.appsList.sorted{
            
            return $0.updateType < $1.updateType
        }
    }
    
    private func showBannedApp(app: AppModel) -> Bool{
        if isBanMode {
            return true
        }
        if app.isBan == true {
            return false
        }
        return true
    }
}


extension String {
    func matches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
}
