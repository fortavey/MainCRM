//
//  TasksListViewModel.swift
//  MainCRM
//
//  Created by Main on 18.03.2025.
//

import Foundation
import Combine
import FirebaseFirestore

final class TasksListViewModel: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    var tasksFMList: [TaskFirstModerationModel] = []
    
    func getTasksFMList(){
        FirebaseServices().getDocuments(collection: "taskfirsmoderation") { docs in
            var array: [TaskFirstModerationModel] = []
                        
            docs.forEach{doc in
                let id = doc.documentID
                let appId = doc["appId"] as? String
                let firstAppName = doc["firstAppName"] as? String
                let createAccount = doc["createAccount"] as? String
                let moderationStatus = doc["moderationStatus"] as? String
                let updateType = doc["updateType"] as? String
                let driveLink = doc["updateType"] as? String
                let isDone = doc["isDone"] as? Bool
                array.append(
                    TaskFirstModerationModel(
                        id: id,
                        appId: appId ?? "",
                        firstAppName: firstAppName ?? "",
                        createAccount: createAccount ?? "",
                        moderationStatus: moderationStatus ?? "",
                        updateType: updateType ?? "",
                        driveLink: driveLink ?? "",
                        isDone: isDone ?? false
                    )
                )
            }
            self.tasksFMList = array
            self.objectWillChange.send()
        }
    }
    
    func isLoad() -> Bool{
        return tasksFMList.count > 0
    }
}
