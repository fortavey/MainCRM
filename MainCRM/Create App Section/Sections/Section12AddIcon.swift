//
//  Section12AddIcon.swift
//  MainCRM
//
//  Created by Main on 09.03.2025.
//

import SwiftUI

struct Section12AddIcon: View {
    var appName: String
    @Binding var sections: [Int]
    var index: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack{
                    Spacer()
                    Image(systemName: "12.square")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                Text("Добавляем иконку в приложение")
                    .font(.title)
                
                Text("В Android Studio нажать правой кнопкой на папку app/res в левом столбце")
                
                Text("В контекстном меню выбрать New - Image Assets")
                
                Text("После чего выбрать картинку и подогнать размеры")
                
                
                DefaultButtonView(title: "Готово") {
                    sections.append(index+1)
                }
            }
            Spacer()
        }
        .sectionModifiers()
    }
}
