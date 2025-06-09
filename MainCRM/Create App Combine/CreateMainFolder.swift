//
//  CreateMainFolder.swift
//  MainCRM
//
//  Created by Main on 25.05.2025.
//

import SwiftUI

struct CreateMainFolder: View {
    @EnvironmentObject private var combineVM: CreateAppCombineViewModel
    @State private var isSuccess: Bool = false
    var body: some View {
        HStack{
            Image(systemName: isSuccess ?  "checkmark.circle" : "xmark.circle")
                .imageScale(.large)
                .foregroundStyle(isSuccess ? .green : .red)
            Button("Создать приложение"){
                start()
            }
        }
    }
    
    func start(){
        let manager = FileManager.default
        if manager.fileExists(atPath: FConfig.mainDir) {
            do {
                try manager.createDirectory(atPath: "\(FConfig.mainDir)/\(combineVM.appName)", withIntermediateDirectories: true)
                isSuccess = true
            } catch {
                print("Error: \(error)")
            }
        } else {
            print("Нет главной папки - NewApps")
        }
    }
}
