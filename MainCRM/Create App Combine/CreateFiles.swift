//
//  CreateFiles.swift
//  MainCRM
//
//  Created by Main on 25.05.2025.
//

import SwiftUI

struct CreateFiles: View {
    @EnvironmentObject private var combineVM: CreateAppCombineViewModel
    @State private var isSuccess: Bool = false
    
    var body: some View {
        HStack{
            Image(systemName: isSuccess ?  "checkmark.circle" : "xmark.circle")
                .imageScale(.large)
                .foregroundStyle(isSuccess ? .green : .red)
            Button("Создать файлы"){
                start()
            }
        }
    }
    
    func start(){
        let manager = FileManager.default
        let mainPath = "\(combineVM.pathToApp)"
        let prefix = combineVM.appPrefix
        let lower = prefix.lowercased()
        if manager.fileExists(atPath: FConfig.mainDir) {
            manager.createFile(atPath: "\(mainPath)/App.tsx",
                               contents: AppCode(prefix: prefix).getCode())
            manager.createFile(atPath: "\(mainPath)/App1.tsx",
                               contents: App1Code(prefix: prefix).getCode())
            
            manager.createFile(atPath: "\(combineVM.configsPath)/\(lower)Colors.tsx",
                               contents: ConfigsCode(prefix: prefix).getCode())
            manager.createFile(atPath: "\(combineVM.assetsPath)/\(lower)Products.tsx",
                               contents: ProductsCodeRU(prefix: prefix).getCode())
            manager.createFile(atPath: "\(combineVM.assetsPath)/\(lower)Broadcasts.tsx",
                               contents: BroadcastsCode(prefix: prefix).getCode())
            
            manager.createFile(atPath: "\(combineVM.screensPath)/\(prefix)HomePage.tsx",
                               contents: HomePageCode(prefix: prefix, appName: combineVM.appRealName).getCode())
            manager.createFile(atPath: "\(combineVM.screensPath)/\(prefix)BookingPage.tsx",
                               contents: BookingPageCode(prefix: prefix).getCode())
            manager.createFile(atPath: "\(combineVM.screensPath)/\(prefix)BroadcastsPage.tsx",
                               contents: BroadcastsPageCode(prefix: prefix).getCode())
            manager.createFile(atPath: "\(combineVM.screensPath)/\(prefix)MenuPage.tsx",
                               contents: MenuPageCode(prefix: prefix).getCode())
            manager.createFile(atPath: "\(combineVM.screensPath)/\(prefix)ContactsPage.tsx",
                               contents: ContactsPageCode(prefix: prefix).getCode())
            manager.createFile(atPath: "\(combineVM.screensPath)/\(prefix)SuccessPage.tsx",
                               contents: SuccessPageCode(prefix: prefix).getCode())

            isSuccess = true
        } else {
            print("Нет главной папки - NewApps")
        }
    }
}
