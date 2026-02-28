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
    @EnvironmentObject private var appUpdate404StatusVM: AppUpdate404StatusViewModel
    var app: AppModel
    
    var body: some View {
//        show404Status()
        Button("Test"){
            fetch()
        }
    }
    
    private func show404Status() -> some View {
        if let item = appUpdate404StatusVM.statusCodesList.first(where: {$0.id == app.id}) {
            if item.response == App404Status.active.rawValue {
                return Image(systemName: "checkmark")
                    .foregroundColor(.green)
            }else if item.response == App404Status.inactive.rawValue {
                return Image(systemName: "xmark")
                    .foregroundColor(.red)
            }else {
                return Image(systemName: "exclamationmark.square")
                    .foregroundColor(.yellow)
            }
        } else {
            return Image(systemName: "exclamationmark.square")
                .foregroundColor(.yellow)
        }
    }
    
    func fetch() {
        let url = URL(string: "https://play.google.com/store/apps/details?id=com." + String(app.firstAppName.filter { !" \n\t\r".contains($0) }).lowercased())!
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error Playstore")
            }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    print("Success Playstore")
                }else {
                    print("Else Error Playstore")
                }
            }
        }
        task.resume()
    }
}
