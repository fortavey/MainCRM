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
    @Binding var isCompMode: Bool
    @Binding var isCreoMode: Bool
    @Binding var isPresented: Bool
    @Binding var isBanMode: Bool
    @Binding var isSelfMode: Bool
    @Binding var isWebviewMode: Bool
    @Binding var isFilterMode: Bool
    
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
            // Кнопка фильтра
            Button {
                isFilterMode.toggle()
            } label: {
                MenuIconView(systemName: "arrow.up.arrow.down.circle.fill")
                    .foregroundStyle(isFilterMode ? Color.red : Color.white)
                    .contextMenu {
                        Text("Показать фильтры")
                    }
            }
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
