//
//  NewAppsListViewModel.swift
//  MainCRM
//
//  Created by Main on 16.03.2025.
//

import Foundation
import Combine
import FirebaseFirestore

final class BlankAppsListViewModel: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    var appsList: [BlankAppModel] = []
    
    func getAppsList(){
        FirebaseServices().getDocuments(collection: "newapps") { docs in
            var array: [BlankAppModel] = []
            
            docs.forEach{doc in
                let id = doc.documentID
                let name = doc["name"] as? String
                let devLink = doc["devLink"] as? String
                let webviewDomain = doc["webviewDomain"] as? String
                array.append(
                    BlankAppModel(
                        id: id,
                        name: name ?? "",
                        devLink: devLink ?? "",
                        webviewDomain: webviewDomain ?? ""
                    )
                )
            }
            self.appsList = array
            self.objectWillChange.send()
        }
    }
    
    func isLoad() -> Bool{
        return appsList.count > 0
    }
    
}

