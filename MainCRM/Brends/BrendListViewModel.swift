//
//  BrendListViewModel.swift
//  MainCRM
//
//  Created by Main on 27.03.2025.
//


import Combine
import FirebaseFirestore

final class BrendListViewModel: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    var brendsList: [BrendModel] = []
    
    func getBrendsList(){
        FirebaseServices().getDocuments(collection: "brends") { docs in
            var array: [BrendModel] = []
            
            docs.forEach{doc in
                let id = doc.documentID
                let name = doc["name"] as? String
                let alias = doc["alias"] as? String
                let countriesArr = doc["countries"] as? [String]
                let localizationsArr = doc["localizations"] as? [String]
                
                let countries: [Countries] = countriesArr?.compactMap{Countries(rawValue: $0)} ?? []
                let localizations: [Localizations] = localizationsArr?.compactMap{Localizations(rawValue: $0)} ?? []
                
                array.append(
                    BrendModel(
                        id: id,
                        name: name ?? "",
                        alias: alias,
                        countries: countries,
                        localizations: localizations
                    )
                )
            }
            self.brendsList = array
            self.objectWillChange.send()
        }
    }
    
    func isLoad() -> Bool{
        return brendsList.count > 0
    }
    
}
