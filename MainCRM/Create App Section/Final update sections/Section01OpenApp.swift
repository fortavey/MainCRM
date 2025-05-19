//
//  Section01OpenApp.swift
//  MainCRM
//
//  Created by Main on 24.03.2025.
//

import SwiftUI

struct Section01OpenApp: View {
    var app: TaskWebViewModel
    @Binding var sections: [Int]
    var index: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Spacer()
                Image(systemName: "01.square")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            Text("Запуск приложение на компьютере - \(app.devComp)")
                .font(.title)
            HStack {
                Text("Открываем Android studio. Находим приложение ")
                CopyTextView(text: "\(app.firstAppName)")
                Text(" и запускаем его")
                Spacer()
            }
            Text("Создание Firebase")
                .font(.title)
            Text("Открываем трансферный аккаунт - \(app.transferAccount)")
            HStack{
                Text("Создаем профиль Firebase: ")
                CopyTextView(text: "\(app.newAppName)-\(app.firstAppName)")
            }
            HStack{
                Text("ID пакета: ")
                CopyTextView(text: "\(app.appId)")
            }
            
            HStack{
                Text("Устанавливаем зависимости")
                CopyTextView(text: "npm i @react-native-firebase/app @react-native-firebase/analytics @react-native-firebase/remote-config")
            }
            
            DefaultButtonView(title: "Готово") {
                sections.append(index+1)
            }
        }
        .sectionModifiers()
    }
}
