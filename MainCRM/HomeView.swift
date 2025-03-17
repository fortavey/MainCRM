//
//  HomeView.swift
//  MainCRM
//
//  Created by Main on 08.03.2025.
//

import SwiftUI
import FirebaseCore

struct HomeView: View {
    @EnvironmentObject private var trustAccountsVM: TrustAccountsViewModel
    
    var body: some View {
        TabView {
            DashboardView()
                .tabItem {
                    Text("Дашборд")
                }
                .navigationTitle("DASH")
            if trustAccountsVM.isLoad() {
                TrustAccountsView()
                    .tabItem {
                        Text("Аккаунты")
                    }
            }
            AppListView()
                .tabItem {
                    Text("Приложения")
                }
            SelfAccountsView()
                .tabItem {
                    Text("Самофарм")
                }
        }
    }
}

#Preview {
    HomeView()
}

struct LoginView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var pass = ""
    
    let firebaseManager = FirebaseManager()
    
    var body: some View {
        VStack{
            TextField("Name", text: $name)
            TextField("Email", text: $email)
            TextField("Pass", text: $pass)
            Button("Registration") {
                firebaseManager.registerNewUser(user: UserData(name: name, email: email, pass: pass))
            }
        }
        .padding()
        .frame(width: 300, height: 100)
    }
}
