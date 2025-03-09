//
//  Section04StartInAndroidStudio.swift
//  MainCRM
//
//  Created by Main on 09.03.2025.
//

import SwiftUI

struct Section04StartInAndroidStudio: View {
    var appName: String
    @Binding var sections: [Int]
    var index: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack{
                    Spacer()
                    Image(systemName: "04.square")
                }
                Text("Запуск приложения в Andriod Studio")
                    .font(.title)
                
                Text("Запускаем Andriod Studio. В Andriod Studio нажимаем 'Open' и выбираем папку \(appName)/android")
                
                Text("Дожидаемся окончания процесса загрузки в правом нижнем углу")
                
                Text("Запускаем приложение и ждем успешного запуска")
                
                DefaultButtonView(title: "Готово") {
                    sections.append(index+1)
                }
            }
            Spacer()
        }
        .sectionModifiers()
    }
}
