//
//  AppListViewModel.swift
//  MainCRM
//
//  Created by Main on 13.03.2025.
//

import Foundation
import Combine
import FirebaseFirestore

final class AppListViewModel: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    var appsList: [AppModel] = []
    
    func getAppsList(){
        FirebaseServices().getDocuments(collection: "apps") { docs in
            var array: [AppModel] = []
            
            docs.forEach{doc in
                let id = doc.documentID
                let devComp = doc["devComp"] as? String
                let firstAppName = doc["firstAppName"] as? String
                let devLink = doc["devLink"] as? String
                let createAccount = doc["createAccount"] as? String
                let transferAccount = doc["transferAccount"] as? String
                let moderationStatus = doc["moderationStatus"] as? String
                let moderationChangeTime = doc["moderationChangeTime"] as? Date
                let updateType = doc["updateStatus"] as? String
                let localizations = doc["localizations"] as? [String]
                let newAppName = doc["newAppName"] as? String
                let storeLink = doc["storeLink"] as? String
                let driveLink = doc["driveLink"] as? String
                let creoLink = doc["creoLink"] as? String
                let isBan = doc["isBan"] as? Bool
                array.append(
                    AppModel(
                        id: id,
                        devComp: devComp ?? "",
                        firstAppName: firstAppName ?? "",
                        devLink: devLink ?? "",
                        createAccount: createAccount ?? "",
                        transferAccount: transferAccount,
                        moderationStatus: moderationStatus ?? "",
                        moderationChangeTime: moderationChangeTime ?? Date(),
                        updateType: updateType ?? "",
                        newAppName: newAppName ?? "",
                        localizations: localizations,
                        storeLink: storeLink ?? "",
                        driveLink: driveLink ?? "",
                        creoLink: creoLink,
                        isBan: isBan
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
