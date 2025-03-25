//
//  Section05Final.swift
//  MainCRM
//
//  Created by Main on 24.03.2025.
//

import SwiftUI

struct Section05Final: View {
    var app: TaskWebViewModel
    @Binding var sections: [Int]
    var index: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Spacer()
                Image(systemName: "05.square")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            Text("Добавляем иконку, меняем название, заливаем билд")
                .font(.title)
            Text("Добавляем иконку")
                .font(.title3)
            
            if let link = URL(string: app.creoLink) {
                Link(destination: link) {
                    HStack{
                        Text("Открыть Google Диск")
                        Image("GoogleDriveIcon")
                            .resizable()
                            .frame(width: 17, height: 17)
                    }
                }
            }
            
            Text("Изменяем название приложения в файлах package.json и strings.xml")
                .font(.title3)
            
            CopyTextView(text: app.newAppName)
            
            Text("Сбрасываем зависимости")
                .font(.title3)
            
            CopyTextView(text: "cd android")
            CopyTextView(text: "./gradlew clean")
            CopyTextView(text: "cd ..")
            
            Text("Перезапускаем приложение, проверяем работоспособность, иконку, название")
                .font(.title3)
                .padding(.bottom, 10)
            
            HStack{
                Text("Отключаем Webview в файле ")
                CopyTextView(text: "\(String(app.firstAppName.filter { !" \n\t\r".contains($0) }).lowercased())_startRequest.php")
            }
            .padding(.bottom, 30)
            
            
            Text("Собираем билд, заливаем обновление")
                .font(.title2)
            HStack {
                Text("Загружаем собранный билд для приложения \(app.appId) на аккаунт - \(app.createAccount)")
                Spacer()
            }
            
            DefaultButtonView(title: "Готово") {
                sections.append(index+1)
            }
        }
        .sectionModifiers()
    }
}
