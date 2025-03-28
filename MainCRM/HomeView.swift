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
            if MainConfig.isAdmin {
                TrustAccountsView()
                    .tabItem {
                        Text("Аккаунты")
                    }
                AppListView()
                    .tabItem {
                        Text("Приложения")
                    }
                SelfAccountsView()
                    .tabItem {
                        Text("Самофарм")
                    }
                TasksListView()
                    .tabItem {
                        Text("Задачи")
                    }
                BrendsListView()
                    .tabItem {
                        Text("Бренды")
                    }
            }
        }
    }
}
