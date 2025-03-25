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
            Text("Запуск приложение")
                .font(.title)
            HStack {
                Text("Открываем Android studio. Находим приложение \(app.firstAppName) и запускаем его")
                Spacer()
            }
            Text("Убедится что приложение работает корректно")
            Text("Дожидаемся окончания процесса")
            DefaultButtonView(title: "Готово") {
                sections.append(index+1)
            }
        }
        .sectionModifiers()
    }
}
