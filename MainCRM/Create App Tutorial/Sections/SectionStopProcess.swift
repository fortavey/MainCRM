//
//  SectionStopProcess.swift
//  MainCRM
//
//  Created by Main on 09.03.2025.
//

import SwiftUI

struct SectionStopProcess: View {
    var appName: String
    @Binding var sections: [Int]
    var index: Int
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(index)")
                Text("Останавливаем процессы")
                    .font(.title)
                
                Text("В терминале останавливаем процесс Ctrl+C")
                
                HStack{
                    Text("В Andriod Studio останавливаем процесс, нажимаем")
                    Image(systemName: "stop.circle")
                }
                
                
                DefaultButtonView(title: "Готово") {
                    sections.append(index+1)
                }
            }
            Spacer()
        }
        .sectionModifiers()
    }
}
