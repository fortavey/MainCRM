//
//  SectionCreateKeytool.swift
//  MainCRM
//
//  Created by Main on 09.03.2025.
//

import SwiftUI

struct Section08CreateKeytool: View {
    var appName: String
    @Binding var sections: [Int]
    var index: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack{
                    Spacer()
                    Image(systemName: "08.square")
                }
                Text("Создание Keytool для GooglePlay")
                    .font(.title)
                
                Text("Работа в терминале. Удостоверится что выбрана папка \(appName)")
                
                Text("Вводим команду для генерации нового ключа:")
                CopyTextView(text: "sudo keytool -genkey -v -keystore \(appName.lowercased()).keystore -alias \(appName.lowercased()) -keyalg RSA -keysize 2048 -validity 10000")
                Text("Вводим пароли и всю необходимую информацию")
                
                Text("После завершения в папке \(appName) должен появится файл \(appName.lowercased()).keystore")
                
                Text("Этот файл нужно переместить в папку android/app")
                
                DefaultButtonView(title: "Готово") {
                    sections.append(index+1)
                }
            }
            Spacer()
        }
        .sectionModifiers()
    }
}
