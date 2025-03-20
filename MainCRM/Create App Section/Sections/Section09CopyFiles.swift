//
//  Section09CopyFiles.swift
//  MainCRM
//
//  Created by Main on 09.03.2025.
//

import SwiftUI

struct Section09CopyFiles: View {
    @Binding var sections: [Int]
    var appName: String
    var devLink: String
    var index: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack{
                    Spacer()
                    Image(systemName: "09.square")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                Text("Копируем файлы в проект")
                    .font(.title)
                
                Text("Скачайте файлы проекта")
                    .font(.headline)
                
                if let link = URL(string: devLink) {
                    if devLink.matches("https"){
                        Link(destination: link) {
                            HStack{
                                Text("Скачать")
                                Image("GoogleDriveIcon")
                                    .resizable()
                                    .frame(width: 17, height: 17)
                            }
                        }
                    }
                }
                
                Text("Файлы - App.jsx, babel.config.js, react-native.config")
                
                Text("Папки - src, assets")
                
                Text("Копируем с заменой в корневую папку приложения")
                                
                DefaultButtonView(title: "Готово") {
                    sections.append(index+1)
                }
            }
            Spacer()
        }
        .sectionModifiers()
    }
}
