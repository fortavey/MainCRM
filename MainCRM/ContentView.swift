//
//  ContentView.swift
//  MainCRM
//
//  Created by Main on 08.03.2025.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            CreateNewAppView()
                .tabItem {
                    Image(systemName: "apps.iphone.badge.plus")
                    Text("Создать приложение")
                }
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Главная")
                }
        }
    }
}

#Preview {
    ContentView()
}
