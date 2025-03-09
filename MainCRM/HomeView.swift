//
//  HomeView.swift
//  MainCRM
//
//  Created by Main on 08.03.2025.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            HStack {
                NavigationLink("Список приложений") {
                    AppListView()
                }
                NavigationLink("Трастовые аккаунты") {
                    TrustAccountsView()
                }
                NavigationLink("Самофарм аккаунты") {
                    SelfAccountsView()
                }
            }
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    HomeView()
}
