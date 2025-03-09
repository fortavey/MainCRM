//
//  Section06InstallDeps.swift
//  MainCRM
//
//  Created by Main on 09.03.2025.
//

import SwiftUI

struct Section06InstallDeps: View {
    var appName: String
    @Binding var sections: [Int]
    var index: Int
    
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                HStack{
                    Spacer()
                    Image(systemName: "06.square")
                }
                Text("Устанавливаем зависимости")
                    .font(.title)
                Text("Работа в терминале. Удостоверится что выбрана папка \(appName)")
                Text("Вводим команду для установки зависимостей приложения:")
                CopyTextView(text: "npm i @fortawesome/fontawesome-svg-core @fortawesome/react-native-fontawesome @react-native-async-storage/async-storage @react-navigation/bottom-tabs @react-navigation/drawer @react-navigation/native @react-navigation/stack react-native-gesture-handler react-native-qrcode-svg react-native-reanimated react-native-safe-area-context react-native-screens react-native-svg react-native-vector-icons mobx mobx-react-lite @fortawesome/free-solid-svg-icons @react-navigation/native-stack")
                Text("Дожидаемся окончания процесса")
                DefaultButtonView(title: "Готово") {
                    sections.append(index+1)
                }
            }
            
            Spacer()
        }
        .sectionModifiers()
    }
}
