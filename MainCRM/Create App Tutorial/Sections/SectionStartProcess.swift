//
//  SectionStartProcess.swift
//  MainCRM
//
//  Created by Main on 09.03.2025.
//

import SwiftUI

struct SectionStartProcess: View {
    var appName: String
    @Binding var sections: [Int]
    var index: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(index)")
                Text("Запускаем приложение")
                    .font(.title)
                
                Text("В терминале запускаем процесс:")
                
                CopyTextView(text: "npx react-native start")
                
                Text("И запускаем в Android Studio")
                
                
                DefaultButtonView(title: "Готово") {
                    sections.append(index+1)
                }
            }
            Spacer()
        }
        .sectionModifiers()
    }
}
