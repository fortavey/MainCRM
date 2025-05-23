//
//  Section03Server.swift
//  MainCRM
//
//  Created by Main on 24.03.2025.
//

import SwiftUI

struct Section03Server: View {
    var app: TaskWebViewModel
    @State private var isPresented: Bool = false
    @Binding var sections: [Int]
    @State private var isFailure: Bool = false
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
            
            Button("Автоматическая настройка"){
                isPresented = true
            }
            .sheet(isPresented: $isPresented) {
                WebViewServerSheetView(webviewDomain: app.webviewDomain, firstAppName: app.firstAppName, isPresented: $isPresented)
            }
            Button("Ручная настройка"){
                isFailure = true
            }
            
            if isFailure {
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
                    CopyTextView(text: "\(String(app.firstAppName.filter { !" \n\t\r".contains($0) }).lowercased())_startRequest.php")
                }
                
                HStack{
                    Text("Вставляем в него контент ")
                    CopyTextView(text: """
    <?php
    echo json_encode([
        "res" => true,
        "weblink" => "https://1wjpja.top/"
    ]);
    """)
                }
                .padding(.bottom, 10)
            }
            
            DefaultButtonView(title: "Готово") {
                sections.append(index+1)
            }
        }
        .sectionModifiers()
    }
}
