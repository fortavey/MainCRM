//
//  ContentView.swift
//  MainCRM
//
//  Created by Main on 08.03.2025.
//

import SwiftUI
import FirebaseCore

struct ContentView: View {
    
    var body: some View {
        TabView {
            BlankAppsListView()
                .tabItem {
                    Image(systemName: "plus.square")
                }
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                }
        }
    }
}

#Preview {
    ContentView()
}
