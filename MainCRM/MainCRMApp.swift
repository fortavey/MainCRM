//
//  MainCRMApp.swift
//  MainCRM
//
//  Created by Main on 08.03.2025.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth

class AppDelegate: NSObject, NSApplicationDelegate {
    func applicationDidFinishLaunching(_ notification: Notification) {
        FirebaseApp.configure()
    }
}

@main
struct MainCRMApp: App {
    // register app delegate for Firebase setup
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject private var trustAccountsVM = TrustAccountsViewModel()
    @StateObject private var appListVM = AppListViewModel()
    @StateObject private var selfAccountsVM = SelfAccountsViewModel()
    @StateObject private var blankAppsListVM = BlankAppsListViewModel()
    @StateObject private var tasksListVM = TasksListViewModel()
    @StateObject private var brendListVM = BrendListViewModel()
    @StateObject private var appUpdate404StatusVM = AppUpdate404StatusViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .environmentObject(trustAccountsVM)
        .environmentObject(appListVM)
        .environmentObject(selfAccountsVM)
        .environmentObject(blankAppsListVM)
        .environmentObject(tasksListVM)
        .environmentObject(brendListVM)
        .environmentObject(appUpdate404StatusVM)
      }
}
