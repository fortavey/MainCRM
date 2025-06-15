//
//  ParserView.swift
//  MainCRM
//
//  Created by Main on 08.06.2025.
//

import SwiftUI

class IdList {
    static var shared = IdList()
    private init(){}
    var list: [String] = []
}

struct ParserView: View {
    @State private var idList: [String] = []
    @State private var country: String = ""
    var body: some View {
        VStack{
            HStack{
                CountryParseView(country: $country, idList: $idList, countryText: "Бразилия", lang: "pt-br", geo: "br")
                CountryParseView(country: $country, idList: $idList, countryText: "Германия", lang: "de", geo: "de")
                CountryParseView(country: $country, idList: $idList, countryText: "Испания", lang: "es", geo: "es")
                CountryParseView(country: $country, idList: $idList, countryText: "Италия", lang: "it", geo: "it")
                CountryParseView(country: $country, idList: $idList, countryText: "Индия", lang: "en-in", geo: "in")
                CountryParseView(country: $country, idList: $idList, countryText: "Польша", lang: "pl", geo: "pl")
                CountryParseView(country: $country, idList: $idList, countryText: "Франция", lang: "fr", geo: "fr")
                CountryParseView(country: $country, idList: $idList, countryText: "Турция", lang: "tr", geo: "tr")
            }
            List(idList.indices, id: \.self){ index in
                AppIdParserView(country: country, appId: idList[index], number: index+1)
            }
        }
    }
}

struct AppIdParserView: View {
    @EnvironmentObject private var appListVM: AppListViewModel
    var country: String
    var appId: String
    var number: Int
    var body: some View {
        HStack {
            Text("\(number)")
            Text(appId)
                .foregroundStyle(isOurApp(from: appId))
            renderAlarm(from: appId)
        }
    }
    
    private func isOurApp(from id: String) -> Color{
        let appNamesArray = appListVM.appsList.map{ "com." + $0.firstAppName.lowercased() }
        if appNamesArray.contains(id) {
            return .white
        }
        return .sectionBG
    }
    
    private func renderAlarm(from id: String) -> some View{
        let appNameLower = id.components(separatedBy: ".")[1]
        if let app = appListVM.appsList.first(where: { $0.firstAppName.lowercased() == appNameLower }) {
            if app.updateType == "Изменено название" || app.updateType == "Добавлены креативы" {
                if IdList.shared.list.contains("\(number) - \(appId) - \(country)") {
                    
                }else {
                    fetchTgBot(number: number, appId: appId, country: country)
                    IdList.shared.list.append("\(number) - \(appId) - \(country)")
                }
                return Text("+")
            }else {
                return Text("-")
            }
        }
        return Text("")
    }
    
    func fetchTgBot(number: Int, appId: String, country: String) {
        let message = "\(number) - \(appId) - \(country)"
        let url = URL(string: "https://api.telegram.org/bot\(MainConfig.telegramToken)/sendMessage?chat_id=\(MainConfig.telegramUserId)&text=\(message)")
        
        guard let url else { return }
        
        let request = URLRequest(url: url)
                
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil { return }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    print("Сообщение отправлено")
                }else {
                    print("Сообщение не отправлено")
                }
            }
        }
        task.resume()
    }
}

struct CountryParseView: View {
    @Binding var country: String
    @Binding var idList: [String]
    var countryText: String
    var lang: String
    var geo: String
    var query = "Chicken+Road"
    var requestString = "http://localhost:1717/api/googlePlayRequest"
    let timerV = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var intervalText = "1000"
    @State private var interval = 1000
    
    var body: some View {
        VStack{
            HStack {
                TextField("Инт", text: $intervalText)
                    .frame(width: 50)
                Button("->"){
                    guard let num = Int(intervalText) else {return}
                    interval = num
                }
            }
            Button(countryText){
                country = countryText
                fetch(lang: lang, geo:geo)
                interval = 1000
            }
            Text("\(interval)")
                .onReceive(timerV) { _ in
                    if interval < 0 {
                        interval = 1000
                        country = countryText
                        fetch(lang: lang, geo:geo)
                    }
                    interval -= 1
                }
        }
    }
    
    func fetch(lang: String, geo: String) {
        
        let url = URL(string: requestString)
        
        guard let url else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let requestVal = [query, lang, geo]
        let encoder = JSONEncoder()
        let data = try! encoder.encode(requestVal)
        request.httpBody = data
                
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil { return }
            
            if let response = response as? HTTPURLResponse {
                print(response)
                if response.statusCode == 200 {
                    guard let data = data else { return }
                    do {
                        let results = try JSONDecoder().decode([String].self, from: data)
                        idList = results
                    } catch {
                        print("Failure", error)
                    }
                }else {
                    print("Else Error Parser")
                    fetchTgBot()
                }
            }
        }
        task.resume()
    }
    
    func fetchTgBot() {
        let message = "Ошибка парсера"
        let url = URL(string: "https://api.telegram.org/bot\(MainConfig.telegramToken)/sendMessage?chat_id=\(MainConfig.telegramUserId)&text=\(message)")
        
        guard let url else { return }
        
        let request = URLRequest(url: url)
                
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil { return }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    print("Сообщение отправлено")
                }else {
                    print("Сообщение не отправлено")
                }
            }
        }
        task.resume()
    }
}
