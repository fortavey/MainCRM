//
//  Section02VSCode.swift
//  MainCRM
//
//  Created by Main on 24.03.2025.
//

import SwiftUI

struct Section02VSCode: View {
    var app: TaskWebViewModel
    @Binding var sections: [Int]
    var index: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Spacer()
                Image(systemName: "02.square")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            Text("Редактирование кода")
                .font(.title)
            HStack {
                Text("Открываем VSCode. Находим приложение \(app.firstAppName) и запускаем его")
                Spacer()
            }
            .padding(.bottom, 20)
            
            Text("Повышаем версию приложения")
            
            HStack{
                Text("Проверьте внутри файла App.tsx поле 'url' должно быть: ")
                CopyTextView(text: app.webviewDomain)
            }
            HStack{
                Text("Проверьте внутри файла App.tsx поле 'appName' должно быть:: ")
                CopyTextView(text: "\(String(app.firstAppName.filter { !" \n\t\r".contains($0) }).lowercased())")
            }
                .padding(.bottom, 10)
            
            
            DefaultButtonView(title: "Готово") {
                sections.append(index+1)
            }
        }
        .sectionModifiers()
    }
}
