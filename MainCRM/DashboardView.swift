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
            HStack{
                Text("Трастовые аккаунты")
                Spacer()
                if trustAccountsVM.isLoad() {
                    Image(systemName: "checkmark.circle")
                        .foregroundStyle(Color.green)
                }else {
                    Image(systemName: "xmark.circle")
                        .foregroundStyle(Color.red)
                }
                
            }
            HStack{
                Text("Список приложений")
                Spacer()
                if appListVM.isLoad() {
                    Image(systemName: "checkmark.circle")
                        .foregroundStyle(Color.green)
                }else {
                    Image(systemName: "xmark.circle")
                        .foregroundStyle(Color.red)
                }
                
            }
            HStack{
                Text("Самофарм аккаунты")
                Spacer()
                if selfAccountsVM.isLoad() {
                    Image(systemName: "checkmark.circle")
                        .foregroundStyle(Color.green)
                }else {
                    Image(systemName: "xmark.circle")
                        .foregroundStyle(Color.red)
                }
                
            }
            HStack{
                Text("Список задач")
                Spacer()
                if trustAccountsVM.isLoad() {
                    Image(systemName: "checkmark.circle")
                        .foregroundStyle(Color.green)
                }else {
                    Image(systemName: "xmark.circle")
                        .foregroundStyle(Color.red)
                }
                
            }
            HStack{
                Text("Список заготовок")
                Spacer()
                if blankAppsListVM.isLoad() {
                    Image(systemName: "checkmark.circle")
                        .foregroundStyle(Color.green)
                }else {
                    Image(systemName: "xmark.circle")
                        .foregroundStyle(Color.red)
                }
                
            }
        }
        .frame(width: 200)
    }
}
