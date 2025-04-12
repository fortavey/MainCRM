//
//  AppUpdate404StatusViewModel.swift
//  MainCRM
//
//  Created by Main on 12.04.2025.
//

import Foundation
import Combine
import FirebaseFirestore

class StatusCodesHelperClass {
    static var listApps: [AppModel] = []
}

struct ResponsePlayStoreItemModel: Codable, Identifiable {
    var id: String
    var response: String
}

struct ResponsePlayStoreModel: Codable {
    var list: [ResponsePlayStoreItemModel]
}

struct RequestPlayStoreModel: Identifiable, Codable {
    var id: String
    var link: String
}

final class AppUpdate404StatusViewModel: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    var statusCodesList: [ResponsePlayStoreItemModel] = []
    var requestError: Bool = false
    
    func getStatusCodesList(){
        
    }
    
    func isLoad() -> Bool{
        return statusCodesList.count > 0
    }
    
    func start() {
        let newArr = StatusCodesHelperClass.listApps.filter{ $0.isBan != true }
            .map{ RequestPlayStoreModel(
                id: $0.id,
                link: "https://play.google.com/store/apps/details?id=com." + String($0.firstAppName.filter { !" \n\t\r".contains($0) }).lowercased()
            )}
        fetch(requestArray: newArr)
    }
    
    func fetch(requestArray: [RequestPlayStoreModel]) {
        let url = URL(string: "https://domenforplay15.website/test.php")!
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        let requestArrayData = try? JSONEncoder().encode(requestArray)
        request.httpBody = requestArrayData
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.changeRequestErrorStatus(status: true)
                }
                print("Error Playstore")
            }
            
            if let response = response as? HTTPURLResponse {
                if response.statusCode == 200 {
                    print("Success Playstore")
                    guard let data = data else { return }
                    do {
                        let results = try JSONDecoder().decode(ResponsePlayStoreModel.self, from: data)
                        self.statusCodesList = results.list
                        DispatchQueue.main.async {
                            self.objectWillChange.send()
                        }
                        print("Success", self.statusCodesList)
                    } catch {
                        print("Failure", error)
                    }
                }else {
                    DispatchQueue.main.async {
                        self.changeRequestErrorStatus(status: true)
                    }
                    print("Else Error Playstore")
                }
            }
        }
        task.resume()
    }
    
    func changeRequestErrorStatus(status: Bool){
        requestError = status
        objectWillChange.send()
    }
    
    func reset() {
        self.statusCodesList = []
        DispatchQueue.main.async {
            self.objectWillChange.send()
        }
    }
}
