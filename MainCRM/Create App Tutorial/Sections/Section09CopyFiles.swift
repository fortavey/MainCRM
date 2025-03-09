//
//  Section09CopyFiles.swift
//  MainCRM
//
//  Created by Main on 09.03.2025.
//

import SwiftUI

struct Section09CopyFiles: View {
    var appName: String
    @Binding var sections: [Int]
    var index: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack{
                    Spacer()
                    Image(systemName: "09.square")
                }
                Text("Копируем файлы в проект")
                    .font(.title)
                
                Text("Файлы - App.jsx, babel.config.js, react-native.config")
                
                Text("Папки - src, assets")
                
                Text("Копируем с заменой в корневую папку приложения")
                
                Text("Удаляем файл App.tsx (Если есть)")
                
                DefaultButtonView(title: "Готово") {
                    sections.append(index+1)
                }
            }
            Spacer()
        }
        .sectionModifiers()
    }
}
