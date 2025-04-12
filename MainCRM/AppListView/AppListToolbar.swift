//
//  AppListToolbar.swift
//  MainCRM
//
//  Created by Main on 17.03.2025.
//

import SwiftUI

struct AppListToolbar: View {
    @EnvironmentObject private var trustAccountsVM: TrustAccountsViewModel
    @EnvironmentObject private var appListVM: AppListViewModel
    @EnvironmentObject private var selfAccountsVM: SelfAccountsViewModel
    @EnvironmentObject private var tasksListVM: TasksListViewModel
    @EnvironmentObject private var blankAppsListVM: BlankAppsListViewModel
    @Binding var isRemoveMode: Bool
    @Binding var isLinkMode: Bool
    @Binding var isPlayStoreMode: Bool
    @Binding var isCompMode: Bool
    @Binding var isCreoMode: Bool
    @Binding var isPresented: Bool
    @Binding var isBanMode: Bool
    @Binding var isSelfMode: Bool
    @Binding var isWebviewMode: Bool
    @Binding var isReadyAppMode: Bool
    @Binding var isFirstNameMode: Bool
    @Binding var isIdMode: Bool
    @Binding var isCountryMode: Bool
    @Binding var isInfoMode: Bool
    
    var body: some View {
        
        HStack{
            // Кнопка добавить
            Button{
                isPresented.toggle()
            } label: {
                MenuIconView(systemName: "plus.circle.fill")
                    .contextMenu {
                        Text("Добавить новое приложение")
                    }
            }
            .sheet(isPresented: $isPresented) {
                AddNewApp(isPresented: $isPresented, appListVM: appListVM)
            }
            // Кнопка ID
            Button {
                isIdMode.toggle()
            } label: {
                MenuIconView(systemName: "grid.circle.fill")
                    .foregroundStyle(isIdMode ? Color.red : Color.white)
                    .contextMenu {
                        Text("Показать ID приложения")
                    }
            }
            // Кнопка компьютеры
            Button {
                isCompMode.toggle()
            } label: {
                MenuIconView(systemName: "macpro.gen3")
                    .foregroundStyle(isCompMode ? Color.red : Color.white)
                    .contextMenu {
                        Text("Показать компьютеры")
                    }
            }
            // Кнопка первое название
            Button {
                isFirstNameMode.toggle()
            } label: {
                MenuIconView(systemName: "character.book.closed")
                    .foregroundStyle(isFirstNameMode ? Color.red : Color.white)
                    .contextMenu {
                        Text("Показать первое название")
                    }
            }
            // Кнопка PlayStore
            Button {
                isPlayStoreMode.toggle()
            } label: {
                Image("GooglePlayIcon")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .padding(2)
                    .contextMenu {
                        Text("Показать ссылки")
                    }
            }
            // Кнопка ссылки
            Button {
                isLinkMode.toggle()
            } label: {
                MenuIconView(systemName: "link.circle.fill")
                    .foregroundStyle(isLinkMode ? Color.red : Color.white)
                    .contextMenu {
                        Text("Показать ссылки")
                    }
            }
            // Кнопка креативы
            Button {
                isCreoMode.toggle()
            } label: {
                MenuIconView(systemName: "photo.on.rectangle.angled")
                    .foregroundStyle(isCreoMode ? Color.red : Color.white)
                    .contextMenu {
                        Text("Показать креативы")
                    }
            }
            // Кнопка БАН
            Button {
                isBanMode.toggle()
            } label: {
                MenuIconView(systemName: "circle.slash")
                    .foregroundStyle(isBanMode ? Color.red : Color.white)
                    .contextMenu {
                        Text("Показать забаненные приложения")
                    }
            }
            // Кнопка Самофарм
            Button {
                isSelfMode.toggle()
            } label: {
                MenuIconView(systemName: "tray.and.arrow.down.fill")
                    .foregroundStyle(isSelfMode ? Color.red : Color.white)
                    .contextMenu {
                        Text("Показать трансфер аккаунты")
                    }
            }
            // Кнопка страны
            Button {
                isCountryMode.toggle()
            } label: {
                MenuIconView(systemName: "globe")
                    .foregroundStyle(isCountryMode ? Color.red : Color.white)
                    .contextMenu {
                        Text("Показать страны")
                    }
            }
            
            // Кнопка Webview
            Button {
                isWebviewMode.toggle()
            } label: {
                MenuIconView(systemName: "wonsign.gauge.chart.lefthalf.righthalf")
                    .foregroundStyle(isWebviewMode ? Color.red : Color.white)
                    .contextMenu {
                        Text("Показать ссылку Webview")
                    }
            }
            
            // Кнопка готовых приложений
            Button {
                isReadyAppMode.toggle()
            } label: {
                MenuIconView(systemName: "checkmark.diamond")
                    .foregroundStyle(isReadyAppMode ? Color.red : Color.white)
                    .contextMenu {
                        Text("Показать готовые приложения")
                    }
            }
            // Кнопка информации
            Button {
                isInfoMode.toggle()
            } label: {
                MenuIconView(systemName: "info.circle")
                    .foregroundStyle(isInfoMode ? Color.red : Color.white)
                    .contextMenu {
                        Text("Показать информацию")
                    }
            }
            // Кнопка удаление
            Button {
                isRemoveMode.toggle()
            } label: {
                MenuIconView(systemName: "trash.circle.fill")
                    .foregroundStyle(isRemoveMode ? Color.red : Color.white)
                    .contextMenu {
                        Text("Показать кнопки удаления")
                    }
            }
            
            
            
            Spacer()
            
            // Кнопка Web-интерфейс
            WebInterfaceButtonView()
            
            // Кнопка гугл диск
            GoogleDriveButtonView()
            
            // Кнопка сервера
            ServerButtonView()
            
            // Кнопка обновления 404
            AppUpdate404StatusView()
            
            // Кнопка обновления
            Button {
                trustAccountsVM.getAccountsList()
                appListVM.getAppsList()
                selfAccountsVM.getAccountsList()
                tasksListVM.getTasksFMList()
                tasksListVM.getTasksRNList()
                blankAppsListVM.getAppsList()
            } label: {
                MenuIconView(systemName: "arrow.clockwise.circle.fill")
                    .contextMenu {
                        Text("Обновить список")
                    }
            }
        }
    }
}


struct ServerButtonView: View {
    var body: some View {
        ZStack{
            if let link = URL(string: "https://ispnl.hyperhost.ua:1500/") {
                Link(destination: link) {
                    MenuIconView(systemName: "server.rack")
                }
            }
        }
        .contextMenu {
            VStack{
                Button("Cкопировать логин"){
                    let pasteboard = NSPasteboard.general
                    pasteboard.declareTypes([NSPasteboard.PasteboardType.string], owner: nil)
                    pasteboard.setString(MainConfig.serverLogin, forType: .string)
                }
                Button("Cкопировать пароль"){
                    let pasteboard = NSPasteboard.general
                    pasteboard.declareTypes([NSPasteboard.PasteboardType.string], owner: nil)
                    pasteboard.setString(MainConfig.serverPassword, forType: .string)
                }
            }
            .padding()
        }
    }
}


struct GoogleDriveButtonView: View {
    var body: some View {
        ZStack{
            if let link = URL(string: "https://drive.google.com/drive/folders/1Naqm1E1XLYIvb49l7VuMQ1hm2ow_uMp6") {
                Link(destination: link) {
                    Image("GoogleDriveIcon")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .padding(2)
                }
            }
        }
        .contextMenu {
            if let link = URL(string: "https://drive.google.com/drive/folders/106Pxrnj_4uqkDB0L47_R0qHP7zR-dnan") {
                Link(destination: link) {
                    Text("Дизайн")
                }
            }
            if let link = URL(string: "https://drive.google.com/drive/folders/1O38VJSDx0fM1y3yv5G_TznKnhTI8pQlO") {
                Link(destination: link) {
                    Text("Приложения")
                }
            }
        }
    }
}



struct WebInterfaceButtonView: View {
    var body: some View {
        ZStack{
            if let link = URL(string: "http://94.154.11.177:1533/") {
                Link(destination: link) {
                    MenuIconView(systemName: "arrow.trianglehead.2.clockwise.rotate.90.page.on.clipboard")
                }
            }
        }
    }
}
