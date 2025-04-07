//
//  LineItemWebview.swift
//  MainCRM
//
//  Created by Main on 06.04.2025.
//

import SwiftUI

struct LineItemWebview: View {
    var app: AppModel
    @State private var isPresented: Bool = false
    
    var body: some View {
        HStack{
            Text(app.webviewDomain ?? "")
            Spacer()
            Button{
                isPresented = true
            }label: {
                Image(systemName: "wonsign.arrow.trianglehead.counterclockwise.rotate.90")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            .buttonStyle(.plain)
            .sheet(isPresented: $isPresented) {
                WebViewServerSheetView(webviewDomain: app.webviewDomain, firstAppName: app.firstAppName, isPresented: $isPresented)
            }
        }
        .frame(width: 230, height: 20)
        .padding(.horizontal, 5)
        .background(Color.sectionBG)
    }
}

struct WebViewServerSheetView: View {
    var webviewDomain: String?
    var firstAppName: String
    @Binding var isPresented: Bool
    @State private var text: String = ""
    @State private var isOn: Bool = true
    @State private var successText = ""
    @State private var failureText = ""
    
    var body: some View {
        VStack{
            Text("Настройки Webview")
                .font(.title)
            Toggle("Включить webview", isOn: $isOn)
            HStack{
                TextField("Ссылка на Webview", text: $text)
                Button("1win"){
                    text = "https://1wjpja.top"
                }
            }
                .padding()
            Text(successText)
                .foregroundStyle(.green)
            Text(failureText)
                .foregroundStyle(.red)
            HStack{
                Button("Закрыть"){
                    isPresented = false
                }
                if !isOn || linkValidation() {
                    Button("Сохранить"){
                        successText = ""
                        failureText = ""
                        fetchServerChanges()
                    }
                }
            }
            
        }
        .padding()
    }
    
    func linkValidation() -> Bool {
        if text.isEmpty {
            return false
        }
        return text.matches("https://")
    }
    
    func fetchServerChanges() {
        guard let webviewDomain else {
            failureText = "Не указан домен webview"
            return
        }
        
        var codeString = ""
        
        if isOn {
            codeString = "<?php echo json_encode([ 'res' => true, 'weblink' => '\(text)']);"
        }else {
            codeString = "<?php echo json_encode([ 'res' => false, 'weblink' => '']);"
        }
        
        let valuesArray = [
            MainConfig.token,
            codeString,
            "\(Helpers().getAppStoreId(appName: firstAppName))_startRequest.php"
        ]
        ServerChangeLoader(
            networkClient: NetworkClient(isPost: true, valuesArray: valuesArray),
            serverUrl: URL(string: "\(webviewDomain)/settings.php")!)
            .loadServerChanges { result in
            switch result {
            case .success(let results):
                if results.result {
                    failureText = ""
                    successText = "Обновление выполнено успешно"
                    print("SUCCESS")
                }
            case .failure(let error):
                successText = ""
                failureText = "Ошибка обновления на сервере"
                print("FAILURE")
            }
        }
    }
}
