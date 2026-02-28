//
//  LineItem404Checker.swift
//  MainCRM
//
//  Created by Main on 12.04.2025.
//

import SwiftUI

enum App404Status: String {
    case active = "HTTP/1.1 200 OK"
    case inactive = "HTTP/1.1 404 Not Found"
}

struct LineItem404Checker: View {
    var app: AppModel
    @State private var isActive: Bool = false
    
    var body: some View {
        Button(action: {
            fetch()
        }){
            if isActive {
                Image(systemName: "checkmark.circle")
                    .foregroundColor(.green)
            }
            else {
                Image(systemName: "arrow.trianglehead.clockwise.icloud")
                    .foregroundColor(.yellow)
            }
            
        }
    }
    
    func fetch() {
        let url = URL(string: "https://play.google.com/store/apps/details?id=com." + String(app.firstAppName.filter { !" \n\t\r".contains($0) }).lowercased())!
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                print("Error Playstore")
            }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    isActive = true
                    print("Success Playstore")
                }else {
                    print("Else Error Playstore")
                }
            }
        }
        task.resume()
    }
}
