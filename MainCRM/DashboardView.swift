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
    
    var body: some View {
        VStack{
            if trustAccountsVM.isLoad() {
                Text("Hello, Dashboard!")
            }else {
                Button {
                    trustAccountsVM.getAccountsList()
                    appListVM.getAppsList()
                    selfAccountsVM.getAccountsList()
                    tasksListVM.getTasksFMList()
                } label: {
                    Text("Сформировать списки")
                }
            }
            HStack{
                Text("Трастовые аккаунты")
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
                if trustAccountsVM.isLoad() {
                    Image(systemName: "checkmark.circle")
                        .foregroundStyle(Color.green)
                }else {
                    Image(systemName: "xmark.circle")
                        .foregroundStyle(Color.red)
                }
                
            }
        }
    }
}
