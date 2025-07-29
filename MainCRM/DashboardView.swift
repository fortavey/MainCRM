//
//  DashboardView.swift
//  MainCRM
//
//  Created by Main on 12.03.2025.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject private var trustAccountsVM: TrustAccountsViewModel
    @EnvironmentObject private var appListVM: AppListViewModel
    @EnvironmentObject private var selfAccountsVM: SelfAccountsViewModel
    @EnvironmentObject private var tasksListVM: TasksListViewModel
    @EnvironmentObject private var blankAppsListVM: BlankAppsListViewModel
    @EnvironmentObject private var parserVM: ParserViewModel
    
    var body: some View {
        VStack{
            if trustAccountsVM.isLoad() {
                Text("Успешно!")
            }else {
                Button {
                    trustAccountsVM.getAccountsList()
                    appListVM.getAppsList()
                    selfAccountsVM.getAccountsList()
                    tasksListVM.updateAll()
                    blankAppsListVM.getAppsList()
                } label: {
                    Text("Сформировать списки")
                }
            }
            if MainConfig.isAdmin {
                HStack {
                    Button("Парсер"){
                        parserVM.changeOpacity()
                    }
                }
            }
        }
        .frame(width: 200)
    }
}
