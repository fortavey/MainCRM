//
//  CopyFiles.swift
//  MainCRM
//
//  Created by Main on 25.05.2025.
//

import SwiftUI

struct CopyFiles: View {
    @EnvironmentObject private var combineVM: CreateAppCombineViewModel
    @State private var isSuccess: Bool = false
    
    var body: some View {
        HStack{
            Image(systemName: isSuccess ?  "checkmark.circle" : "xmark.circle")
                .imageScale(.large)
                .foregroundStyle(isSuccess ? .green : .red)
            Button("Копировать файлы"){
                start()
            }
        }
    }
    
    func start(){
        let manager = FileManager.default
        let lower = combineVM.appPrefix.lowercased()
        if manager.fileExists(atPath: FConfig.mainDir) {
            
                Helper.shared.randomProducts.forEach { (product) in
                    do {
                        try manager.copyItem(atPath: "\(FConfig.imagesPath)/\(product).png", toPath: "\(combineVM.imagessPath)/\(lower)_\(product).png")
                    }catch {
                        print("Error copying file: \(error.localizedDescription)")
                    }
                }
            
                copyBg()
                moveIcon()
                copySuccess()
                
            isSuccess = true
        } else {
            print("Нет главной папки - NewApps")
        }
    }
    
    func moveIcon(){
        let lower = combineVM.appPrefix.lowercased()
        do {
            var icons = try FileManager.default.contentsOfDirectory(atPath: FConfig.logosPath)
            icons = icons.filter{ $0 != ".DS_Store" }
            let icon = icons[Int.random(in: 0..<icons.count)]
            let ext = (icon as NSString).pathExtension
            Helper.shared.ext = ext
            try FileManager.default.moveItem(atPath: "\(FConfig.logosPath)/\(icon)", toPath: "\(combineVM.assetsPath)/\(lower)_logo.\(ext)")
        }catch {
            print("Error moving icon: \(error)")
        }
    }
    
    func copyBg(){
        do {
            var bgs = try FileManager.default.contentsOfDirectory(atPath: FConfig.backgroundsPath)
            bgs = bgs.filter{ $0 != ".DS_Store" }
            let bg = bgs[Int.random(in: 0..<bgs.count)]
            try FileManager.default.copyItem(atPath: "\(FConfig.backgroundsPath)/\(bg)", toPath: "\(combineVM.assetsPath)/bg.png")
        }catch {
            print("Error moving icon: \(error)")
        }
    }
    
    func copySuccess(){
        let lower = combineVM.appPrefix.lowercased()
        do {
            var succeses = try FileManager.default.contentsOfDirectory(atPath: FConfig.successPath)
            succeses = succeses.filter{ $0 != ".DS_Store" }
            let success = succeses[Int.random(in: 0..<succeses.count)]
            try FileManager.default.copyItem(atPath: "\(FConfig.successPath)/\(success)", toPath: "\(combineVM.assetsPath)/\(lower)_success.png")
        }catch {
            print("Error moving icon: \(error)")
        }
    }
}
