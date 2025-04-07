//
//  AppListView.swift
//  MainCRM
//
//  Created by Main on 08.03.2025.
//
import Foundation
import SwiftUI

enum SortingType: String, CaseIterable {
    case updateType = "Тип обновления"
    case firstAppName = "Первое название"
    case newAppName = "Новое название"
    case createAccount = "Аккаунт создания"
    case devComp = "Компьютер"
    case updateDate = "Дата обновления"
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
    @State private var isReadyAppMode = false
    @State private var isFirstNameMode = false
    @State private var isIdMode = false
    @State private var isCountryMode = false
    
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
                    isWebviewMode: $isWebviewMode,
                    isReadyAppMode: $isReadyAppMode,
                    isFirstNameMode: $isFirstNameMode,
                    isIdMode: $isIdMode,
                    isCountryMode: $isCountryMode
                )
                
                    
                HStack{
                    Spacer()
                    Button{
                        sortingType = .updateType
                    }label: {
                        Image(systemName: "arrow.up.arrow.down.square")
                    }
                    Menu {
                        ForEach(SortingType.allCases, id: \.rawValue) { type in
                            Button(type.rawValue){ sortingType = type }
                        }
                    } label: {
                        Text(sortingType.rawValue)
                    }
                    .frame(width: 150)
                }
                
                List(sortingList()
                        .filter{showBannedApp(app: $0)}
                        .filter{showReadyApp(app: $0)}
                ) { app in
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
                            
                            // Id приложения
                            if isIdMode {
                                // LineItemView(text: "com.\(Helpers().getAppStoreId(appName: app.firstAppName))", width: 200)
                                LineItemView(text: app.id, width: 200)
                            }
                            
                            // Компьютер
                            if isCompMode {
                                LineItemView(text: app.devComp, width: 40)
                            }
                            
                            // Первое название
                            if isFirstNameMode {
                                LineItemView(text: app.firstAppName, width: 150)
                            }
                            
                            // Трастовый аккаунт
                            ChangeTrustAccountButton(app: app, width: 100)
                            // Тип обновления приложения
                            ChangeUpdateTypeButton(app: app, width: 150)
                            // Статус модерации
                            ChangeModerationStatusButton(app: app, width: 100)
                            
                            // Время после изменения статуса модерации
                            ZStack{
                                Text(app.lastUpdateTime ?? "10д")
                            }
                            .frame(width: 40, height: 25)
                            .background(Color.sectionBG)
                            
                            // Самофарм аккаунт
                            if isSelfMode {
                                ChangeSelfAccountButton(app: app, width: 100)
                            }
                            
                            // Новое название приложения
                            NewAppNameView(app: app)
                            
                            // Открыть в поиске
                            OpenPlayButtonView(app: app)
                           
                
                            // Страны
                            if isCountryMode {
                                ChooseCountryButtonView(app: app)
                            }
                            
                            
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
                                LineItemWebview(app: app)
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
        switch sortingType {
        case .firstAppName:
            return sortByFirstName()
        case .newAppName:
            return sortByNewName()
        case .createAccount:
            return sortByCreateAccount()
        case .devComp:
            return sortByDevComp()
        case .updateType:
            return sortByUpdateType()
        case .updateDate:
            return sortByUpdateDate()
        }
    }
    
    func sortByFirstName() -> [AppModel]{
        return appListVM.appsList.sorted{ $0.firstAppName < $1.firstAppName }
    }
    
    func sortByNewName() -> [AppModel]{
        return appListVM.appsList.sorted{ $0.newAppName < $1.newAppName }
    }
    
    func sortByCreateAccount() -> [AppModel]{
        
        return appListVM.appsList.sorted{ Helpers().sortAccountNames(accName1: $0.createAccount, accName2: $1.createAccount) }
    }
    
    func sortByDevComp() -> [AppModel]{
        return appListVM.appsList.sorted{ $0.devComp < $1.devComp }
    }
    
    func sortByUpdateType() -> [AppModel]{
        return appListVM.appsList.sorted{ $0.updateType < $1.updateType }
    }
    
    func sortByUpdateDate() -> [AppModel]{
        return appListVM.appsList.sorted{ $0.moderationChangeTime < $1.moderationChangeTime }
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
    
    private func showReadyApp(app: AppModel) -> Bool{
        if isReadyAppMode {
            return true
        }
        guard let transfer = app.isTransfer else { return true }
       
        if transfer == true {
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


struct NewAppNameView: View {
    @EnvironmentObject private var appListVM: AppListViewModel
    var app: AppModel
    var width: CGFloat = 150
    
    var body: some View {
        
        ZStack{
            NewAppNameButton(app: app, width: width)
            HStack{
                Spacer()
                if app.isRenamed != nil {
                    HStack{
                        Spacer()
                        if let version = app.renameVersion {
                            Image(systemName: "0\(version).square")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .foregroundStyle(.orange)
                        }else {
                            Image(systemName: "01.square")
                                .foregroundStyle(.orange)
                        }
                    }
                    .padding(.trailing, 10)
                }
                if let local = app.localizations {
                    if local.count > 0 {
                        LocalizationButton(app: app)
                    }
                }
            }
            .frame(width: width)
        }
        .contextMenu {
            Button("+ Переименование"){
                FirebaseServices().updateDocument(id: app.id,
                                                  collection: "apps",
                                                  fields: [
                                                    "isRenamed": true,
                                                    "renameVersion" : getNewRenameVersion()
                                                  ]) { result in
                    if result {
                        appListVM.getAppsList()
                    }else {
                        print("Ошибка обновления")
                    }
                }
            }
           }
    }
    
    private func getNewRenameVersion() -> Int {
        if let version = app.renameVersion {
            return version + 1
        }else {
            return 1
        }
    }
}

struct ContextMenuOpenWebView: View {
    @Binding var isPresented: Bool
    var app: AppModel
    
    var body: some View {
        VStack{
            ForEach(getKeysList(), id: \.self){ key in
                Menu{
                    ForEach(Countries.allCases, id: \.rawValue) { country in
                        Menu {
                            ForEach(Localizations.allCases, id: \.rawValue) { language in
                                if let link = URL(string: "https://play.google.com/store/search?q=\(getStringForSearch(name: key))&c=apps&hl=\(language.rawValue)&gl=\(country)") {
                                    Link(destination: link) {
                                        Text(language.title)
                                    }
                                }
                            }
                        } label: {
                            Text(country.rawValue)
                        }
                    }
                }label: {
                    Text(key)
                }
            }
            Button("Закрыть") {
                isPresented = false
            }
        }
        .padding()
    }
    
    private func getKeysList() -> [String] {
        if let localizations = app.localizations, localizations.count > 0 {
            var newArr = localizations.map{
                let arr = $0.components(separatedBy: " - ")
                return arr[1]
            }
            newArr.append(app.newAppName)
            return Array(Set(newArr))
        }else {
            return [app.newAppName]
        }
    }
    
    
    
    func getStringForSearch(name: String) -> String {
        return name.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)

    }
}

struct OpenPlayButtonView: View {
    var app: AppModel
    @State private var isPresented: Bool = false
    
    var body: some View {
        Button {
            isPresented = true
        } label: {
            Image(systemName: "globe")
                .foregroundStyle(.blue)
        }
        .sheet(isPresented: $isPresented) {
            ContextMenuOpenWebView(isPresented: $isPresented, app: app)
        }
    }
}
