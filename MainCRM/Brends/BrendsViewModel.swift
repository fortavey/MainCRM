//
//  BrendsViewModel.swift
//  MainCRM
//
//  Created by mm2 on 16.04.2026.
//

import Foundation
import Combine
import FirebaseFirestore

struct BrendModel: Identifiable, Hashable {
    var id:String
    var name:String
    var trackerLink:String
    var creoLink:String
}

final class BrendsViewModel: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    var brendsList: [BrendModel] = []
    
    func getBrendsList(){
        FirebaseServices().getDocuments(collection: "brends") { docs in
            var array: [BrendModel] = []
            
            docs.forEach{doc in
                let id = doc.documentID
                let name = doc["name"] as? String
                let trackerLink = doc["trackerLink"] as? String
                let creoLink = doc["creoLink"] as? String
                array.append(
                    BrendModel(
                        id: id,
                        name: name ?? "",
                        trackerLink: trackerLink ?? "",
                        creoLink: creoLink ?? ""
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
