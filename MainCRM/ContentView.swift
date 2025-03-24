//
//  ContentView.swift
//  MainCRM
//
//  Created by Main on 08.03.2025.
//
import Foundation
import SwiftUI
import FirebaseCore

struct ContentView: View {
    @EnvironmentObject private var trustAccountsVM: TrustAccountsViewModel
    @EnvironmentObject private var appListVM: AppListViewModel
    @EnvironmentObject private var selfAccountsVM: SelfAccountsViewModel
    @EnvironmentObject private var tasksListVM: TasksListViewModel
    @EnvironmentObject private var blankAppsListVM: BlankAppsListViewModel
    
    let timer = Timer.publish(every: 10, on: .main, in: .common).autoconnect()
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                }
            BlankAppsListView()
                .tabItem {
                    Image(systemName: "plus.square")
                }
        }
        .onReceive(timer) { firedDate in
            updateData()
        }
    }
    
    private func updateData() {
        trustAccountsVM.getAccountsList()
        appListVM.getAppsList()
        selfAccountsVM.getAccountsList()
        tasksListVM.updateAll()
        blankAppsListVM.getAppsList()
    }
}
