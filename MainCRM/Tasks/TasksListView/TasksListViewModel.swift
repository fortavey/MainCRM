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
    var tastsRNList: [TaskRenameModel] = []
    var tastsCRList: [TaskCreoModel] = []
    
    func isTaskExists(id: String) -> Bool{
        let fm = tasksFMList.contains{ $0.id == id }
        let rn = tastsRNList.contains{ $0.id == id }
        let cr = tastsCRList.contains{ $0.id == id }
        
        return fm || rn || cr
    }
    
    func isTaskDone(id: String) -> Bool? {
        if let task = tasksFMList.first(where: {$0.id == id}) {
            return task.isDone
        } else if let task = tastsRNList.first(where: {$0.id == id}) {
            return task.isDone
        } else if let task = tastsCRList.first(where: {$0.id == id}) {
            return task.isDone
         }
        return nil
    }
    
    func getTasksFMList(){
        FirebaseServices().getDocuments(collection: "taskfirsmoderation") { docs in
            var array: [TaskFirstModerationModel] = []
                        
            docs.forEach{doc in
                let id = doc.documentID
                let firstAppName = doc["firstAppName"] as? String
                let createAccount = doc["createAccount"] as? String
                let moderationStatus = doc["moderationStatus"] as? String
                let updateType = doc["updateType"] as? String
                let driveLink = doc["updateType"] as? String
                let isDone = doc["isDone"] as? Bool
                let message = doc["message"] as? String
                array.append(
                    TaskFirstModerationModel(
                        id: id,
                        firstAppName: firstAppName ?? "",
                        createAccount: createAccount ?? "",
                        moderationStatus: moderationStatus ?? "",
                        updateType: updateType ?? "",
                        driveLink: driveLink ?? "",
                        isDone: isDone ?? false, 
                        message: message ?? ""
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
