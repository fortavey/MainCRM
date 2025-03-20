//
//  Section07NavigationSettings.swift
//  MainCRM
//
//  Created by Main on 09.03.2025.
//

import SwiftUI

struct Section07NavigationSettings: View {
    var appName: String
    @Binding var sections: [Int]
    var index: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack{
                    Spacer()
                    Image(systemName: "07.square")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                Text("Настройки навигации")
                    .font(.title)
                
                Text("Отредактировать файл MainActivity.kt который находится по адресу android/app/src/main/java/com/\(appName.lowercased())/")
                
                Text("Добавить строки:")
                CopyTextView(text: "import android.os.Bundle;")
                Text("И")
                CopyTextView(text:
"""
override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(null)
}
"""
                )
                
                Image("navigation")
                Text("Сохраняем файл")
                
                DefaultButtonView(title: "Готово") {
                    sections.append(index+1)
                }
            }
            Spacer()
        }
        .sectionModifiers()
    }
}
