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
                let moderationChangeTime = doc["moderationChangeTime"] as? Int
                let updateType = doc["updateStatus"] as? String
                let localizations = doc["localizations"] as? [String]
                let newAppName = doc["newAppName"] as? String
                let storeLink = doc["storeLink"] as? String
                let driveLink = doc["driveLink"] as? String
                let creoLink = doc["creoLink"] as? String
                let isBan = doc["isBan"] as? Bool
                let webviewDomain = doc["webviewDomain"] as? String
                let countries = doc["countries"] as? [String]
                let isAsoMobile = doc["isAsoMobile"] as? Bool
                let isTransfer = doc["isTransfer"] as? Bool
                let isRenamed = doc["isRenamed"] as? Bool
                let renameVersion = doc["renameVersion"] as? Int
                let lastUpdateTime = doc["lastUpdateTime"] as? String
                let isUACReady = doc["isUACReady"] as? Bool
                array.append(
                    AppModel(
                        id: id,
                        devComp: devComp ?? "",
                        firstAppName: firstAppName ?? "",
                        devLink: devLink ?? "",
                        createAccount: createAccount ?? "",
                        transferAccount: transferAccount,
                        moderationStatus: moderationStatus ?? "",
                        moderationChangeTime: moderationChangeTime ?? 1742016421,
                        updateType: updateType ?? "",
                        newAppName: newAppName ?? "",
                        localizations: localizations,
                        storeLink: storeLink ?? "",
                        driveLink: driveLink ?? "",
                        creoLink: creoLink,
                        isBan: isBan,
                        webviewDomain: webviewDomain,
                        countries: countries,
                        isAsoMobile: isAsoMobile,
                        isTransfer: isTransfer,
                        isRenamed: isRenamed,
                        renameVersion: renameVersion,
                        lastUpdateTime: Helpers().getTimeCount(timestamp: moderationChangeTime),
                        isUACReady: isUACReady
                    )
                )
            }
            self.appsList = array
            StatusCodesHelperClass.listApps = array
            self.objectWillChange.send()
        }
    }
    
    func isLoad() -> Bool{
        return appsList.count > 0
    }
    
    func updateSingleDocument(id: String, fields: [AnyHashable : Any]){
        FirebaseServices().updateDocument(id: id,
                                          collection: "apps",
                                          fields: fields) { [weak self] result in
            guard let self else {return}
            if result {
                self.getAppsList()
            }else {
                print("Ошибка обновления приложения")
            }
        }
    }
}
