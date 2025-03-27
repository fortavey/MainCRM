//
//  Section03Server.swift
//  MainCRM
//
//  Created by Main on 24.03.2025.
//

import SwiftUI

struct Section03Server: View {
    var app: TaskWebViewModel
    @Binding var sections: [Int]
    var index: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Spacer()
                Image(systemName: "03.square")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            Text("Настройки на сервере")
                .font(.title)
            HStack {
                Text("Открываем панель управления сервером.")
                if let link = URL(string: MainConfig.serverUrl) {
                    Link(destination: link) {
                        Text("Открыть")
                    }
                }
                Spacer()
            }
            
            HStack{
                Text("Логин: ")
                CopyTextView(text: MainConfig.serverLogin)
            }
            HStack{
                Text("Пароль: ")
                CopyTextView(text: MainConfig.serverPassword)
            }
                .padding(.bottom, 10)
            
            
            Text("В разделе 'Main -> File manager' находим домен - \(app.webviewDomain)")
                .padding(.bottom, 10)
            
            HStack{
                Text("Создаем файл ")
                CopyTextView(text: "\(String(app.firstAppName.filter { !" \n\t\r".contains($0) }).lowercased()).php")
            }
            
            HStack{
                Text("Вставляем в него контент ")
                CopyTextView(text: "<?php header('Location: https://1wjpja.top/'); ?>")
            }
            .padding(.bottom, 30)
            
            HStack{
                Text("Создаем файл ")
                CopyTextView(text: "\(String(app.firstAppName.filter { !" \n\t\r".contains($0) }).lowercased())_startRequest.php")
            }
            
            HStack{
                Text("Вставляем в него контент ")
                CopyTextView(text: """
<?php
echo json_encode([
    "res" => false,
    "weblink" => "https://1wjpja.top/"
]);
""")
            }
            .padding(.bottom, 10)
            
            DefaultButtonView(title: "Готово") {
                sections.append(index+1)
            }
        }
        .sectionModifiers()
    }
}
