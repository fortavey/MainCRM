//
//  HomeView.swift
//  MainCRM
//
//  Created by Main on 08.03.2025.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        TabView {
            DashboardView()
                .tabItem {
                    Text("Дашборд")
                }
                .navigationTitle("DASH")
                AppListView()
                    .tabItem {
                        Text("Приложения")
                    }
            if MainConfig.isAdmin {
                TrustAccountsView()
                    .tabItem {
                        Text("Аккаунты")
                    }
                SelfAccountsView()
                    .tabItem {
                        Text("Самофарм")
                    }
                TasksListView()
                    .tabItem {
                        Text("Задачи")
                    }
                TaskTimerView()
                    .tabItem {
                        Text("Таймеры")
                    }
                CreateAppCombineView()
                    .tabItem {
                        Text("Комбайн")
                    }
            }
        }
    }
}
