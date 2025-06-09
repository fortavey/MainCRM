//
//  CreateAppCombineView.swift
//  MainCRM
//
//  Created by Main on 25.05.2025.
//

import SwiftUI

struct CreateAppCombineView: View {
    @EnvironmentObject private var combineVM: CreateAppCombineViewModel
    @State private var appName: String = ""
    @State private var appPrefix: String = ""
    @State private var isEnabledFields: Bool = true
    
    var body: some View {
        VStack {
            Text("\(combineVM.appName) - \(combineVM.appPrefix)")
            HStack{
                TextField("Название приложения", text: $appName)
                    .padding()
                    .disabled(!isEnabledFields)
                TextField("Префикс приложения", text: $appPrefix)
                    .padding()
                    .disabled(!isEnabledFields)
            }
            if isEnabledFields{
                Button("Старт"){
                    if appName != "" && appPrefix != ""{
                        combineVM.appRealName = appName
                        combineVM.appPrefix = appPrefix
                        isEnabledFields = false
                    }
                }
            }else {
                Button("Cброс"){
                    combineVM.appRealName = ""
                    combineVM.appPrefix = ""
                    appName = ""
                    appPrefix = ""
                    Helper.shared.refreshProducts()
                    isEnabledFields = true
                }
            }
            
            if !isEnabledFields {
                VStack{
                     CreateMainFolder()
                     CreateDirsStructure()
                     CopyFiles()
                     CreateFiles()
                }
            }
            
            Spacer()
        }
        .padding()
        
        
    }
    
    func attributesOfIcon(){
        do {
            var icons = try FileManager.default.contentsOfDirectory(atPath: FConfig.logosPath)
            icons = icons.filter{ $0 != ".DS_Store" }
            let icon = icons[Int.random(in: 0..<icons.count)]
            let ext = (icon as NSString).pathExtension
            print(ext)
        }catch {
            print("Error moving icon: \(error)")
        }
    }
}
