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
    @EnvironmentObject private var taskTimerVM: TaskTimerViewModel
    @EnvironmentObject private var parserVM: ParserViewModel
    
    let timer = Timer.publish(every: 10, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack{
            if MainConfig.isAdmin {
                ParserView()
                    .opacity(parserVM.opacity)
            }
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
            
            if tasksListVM.isSomeTaskDone() && MainConfig.isAdmin {
                VStack {
                    Spacer()
                    ZStack{
                        Text("Новая выполненная задача")
                    }
                    .frame(width: 200, height: 50)
                    .background(Color.green)
                    .padding(.bottom, 40)
                    
                }
            }
        }
    }
    
    private func updateData() {
        trustAccountsVM.getAccountsList()
        appListVM.getAppsList()
        selfAccountsVM.getAccountsList()
        tasksListVM.updateAll()
        blankAppsListVM.getAppsList()
        taskTimerVM.getTimersList()
    }
}
