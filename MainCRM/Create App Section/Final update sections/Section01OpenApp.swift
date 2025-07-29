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
                CopyTextView(text: "npm i @react-navigation/elements @react-navigation/native @react-navigation/native-stack react-native-safe-area-context react-native-screens @react-native-firebase/app @react-native-firebase/analytics @react-native-firebase/firestore @react-native-firebase/messaging react-native-webview @react-native-async-storage/async-storage react-native-play-install-referrer")
            }
            
            DefaultButtonView(title: "Готово") {
                sections.append(index+1)
            }
        }
        .sectionModifiers()
    }
}
