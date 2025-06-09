//
//  ParserView.swift
//  MainCRM
//
//  Created by Main on 08.06.2025.
//

import SwiftUI

struct SerpApiResponse: Decodable {
    var organic_results: [OneCategory]
}

struct OneCategory: Decodable {
    var items: [OneApp]
}

struct OneApp: Decodable {
    var product_id: String
}

struct ParserView: View {
    @State private var idList: [OneApp] = []
    var apiKey = "5aaba9035a1e9291ccdc20f143091d018011b6900e47c7bb2265e58baff1c192"
    var query = "Chicken Road"
    var requestString = "https://serpapi.com/search.json"
    var body: some View {
        VStack{
            Text(query).font(.title)
            HStack{
                Button("ES"){
                    fetch(lang: "es", geo: "es")
                }
                Button("FR"){
                    fetch(lang: "fr", geo: "fr")
                }
                Button("IT"){
                    fetch(lang: "it", geo: "it")
                }
            }
            List(idList, id: \.product_id){ app in
                Text(app.product_id)
            }
        }
    }
    
    func fetch(lang: String, geo: String) {
        guard var urlComponents = URLComponents(string: requestString) else {
            print("urlComponents")
            return
        }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "engine", value: "google_play"),
            URLQueryItem(name: "q", value: query),
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "gl", value: lang),
            URLQueryItem(name: "hl", value: geo)
        ]
        
        let url = urlComponents.url
        
        guard let url else {
            print("url")
            return
        }
        
        var request = URLRequest(url: url)
                
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error SerpApi")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print(response)
                if response.statusCode == 200 {
                    guard let data = data else { return }
                    do {
                        let results = try JSONDecoder().decode(SerpApiResponse.self, from: data)
                        idList = results.organic_results[0].items
                    } catch {
                        print("Failure", error)
                    }
                }else {
                    print("Else Error SerpApi")
                }
            }
        }
        task.resume()
    }
}
