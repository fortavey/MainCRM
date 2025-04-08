//
//  PlayStoreBanRequest.swift
//  MainCRM
//
//  Created by Main on 07.04.2025.
//

import Foundation

/// Отвечает за загрузку данных по URL
struct PlayStoreBanRequest {
    var app: AppModel
    
    func fetch(handler: @escaping (_ isActive: Bool?) -> Void) {
        guard let url = Helpers().getPlayStoreLink(app: app) else { return handler(nil) }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error Playstore")
                handler(nil)
            }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    print("Success Playstore")
                    handler(true)
                }else if response.statusCode == 404 {
                    print("Failure Playstore")
                    handler(false)
                }else {
                    print("Else Error Playstore")
                    handler(nil)
                }
            }
        }
        
        task.resume()
    }
}
