//
//  TasksListViewModel.swift
//  MainCRM
//
//  Created by Main on 18.03.2025.
//

import Foundation
import Combine
import FirebaseFirestore

enum TaskDB: String, CaseIterable {
    case fm = "taskfirsmoderation"
    case rn = "taskrename"
    case cr = "taskcreo"
    case aso = "taskasomobile"
    case web = "taskwebview"
    case tr = "tasktransfer"
}

final class TasksListViewModel: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    var tasksFMList: [TaskFirstModerationModel] = []
    var tasksRNList: [TaskRenameModel] = []
    var tasksCRList: [TaskCreoModel] = []
    var tasksASOList: [TaskAsoMobileModel] = []
    var tasksWEBList: [TaskWebViewModel] = []
    var tasksTRList: [TaskTransferModel] = []
    
    func isSomeTaskDone() -> Bool {
        let fm = tasksFMList.contains{ $0.isDone }
        let rn = tasksRNList.contains{ $0.isDone }
        let cr = tasksCRList.contains{ $0.isDone }
        let aso = tasksASOList.contains{ $0.isDone }
        let web = tasksWEBList.contains{ $0.isDone }
        let tr = tasksTRList.contains{ $0.isDone }
        
        return fm || rn || cr || aso || web || tr
    }
    
    func getTaskType(id: String) -> String? {
        let fm = tasksFMList.contains{ $0.id == id }
        let rn = tasksRNList.contains{ $0.id == id }
        let cr = tasksCRList.contains{ $0.id == id }
        let aso = tasksASOList.contains{ $0.id == id }
        let web = tasksWEBList.contains{ $0.id == id }
        let tr = tasksTRList.contains{ $0.id == id }
        
        if fm { return TaskDB.fm.rawValue }
        if rn { return TaskDB.rn.rawValue }
        if cr { return TaskDB.cr.rawValue }
        if aso { return TaskDB.aso.rawValue }
        if web { return TaskDB.web.rawValue }
        if tr { return TaskDB.tr.rawValue }
        
        return nil
        
    }
    
    func isTaskExists(id: String) -> Bool{
        let fm = tasksFMList.contains{ $0.id == id }
        let rn = tasksRNList.contains{ $0.id == id }
        let cr = tasksCRList.contains{ $0.id == id }
        let aso = tasksASOList.contains{ $0.id == id }
        let web = tasksWEBList.contains{ $0.id == id }
        let tr = tasksTRList.contains{ $0.id == id }
        
        return fm || rn || cr || aso || web || tr
    }
    
    func isTaskDone(id: String) -> Bool? {
        if let task = tasksFMList.first(where: {$0.id == id}) {
            return task.isDone
        } else if let task = tasksRNList.first(where: {$0.id == id}) {
            return task.isDone
        } else if let task = tasksCRList.first(where: {$0.id == id}) {
            return task.isDone
        } else if let task = tasksASOList.first(where: {$0.id == id}) {
            return task.isDone
        } else if let task = tasksWEBList.first(where: {$0.id == id}) {
            return task.isDone
        } else if let task = tasksTRList.first(where: {$0.id == id}) {
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
                let timestamp = doc["timestamp"] as? Double
                array.append(
                    TaskFirstModerationModel(
                        id: id,
                        firstAppName: firstAppName ?? "",
                        createAccount: createAccount ?? "",
                        moderationStatus: moderationStatus ?? "",
                        updateType: updateType ?? "",
                        driveLink: driveLink ?? "",
                        isDone: isDone ?? false, 
                        message: message ?? "",
                        timestamp: timestamp ?? Date().timeIntervalSince1970
                    )
                )
            }
            self.tasksFMList = array
            self.objectWillChange.send()
        }
    }
    
    func getTasksRNList(){
        FirebaseServices().getDocuments(collection: "taskrename") { docs in
            var array: [TaskRenameModel] = []
                        
            docs.forEach{doc in
                let id = doc.documentID
                let firstAppName = doc["firstAppName"] as? String
                let createAccount = doc["createAccount"] as? String
                let moderationStatus = doc["moderationStatus"] as? String
                let updateType = doc["updateType"] as? String
                let newAppName = doc["newAppName"] as? String
                let localizations = doc["localizations"] as? [String]
                let countries = doc["countries"] as? [String]
                let message = doc["message"] as? String
                let isDone = doc["isDone"] as? Bool
                array.append(
                    TaskRenameModel(
                        id: id,
                        firstAppName: firstAppName ?? "",
                        createAccount: createAccount ?? "",
                        moderationStatus: moderationStatus ?? "",
                        updateType: updateType ?? "",
                        newAppName: newAppName ?? "",
                        localizations: localizations,
                        countries: countries,
                        message: message ?? "",
                        isDone: isDone ?? false
                    )
                )
            }
            self.tasksRNList = array
            self.objectWillChange.send()
        }
    }
    
    func getTasksCRList(){
        FirebaseServices().getDocuments(collection: TaskDB.cr.rawValue) { docs in
            var array: [TaskCreoModel] = []
                        
            docs.forEach{doc in
                let id = doc.documentID
                let firstAppName = doc["firstAppName"] as? String
                let createAccount = doc["createAccount"] as? String
                let moderationStatus = doc["moderationStatus"] as? String
                let updateType = doc["updateType"] as? String
                let newAppName = doc["newAppName"] as? String
                let localizations = doc["localizations"] as? [String]
                let creoLink = doc["creoLink"] as? String
                let message = doc["message"] as? String
                let isDone = doc["isDone"] as? Bool
                array.append(
                    TaskCreoModel(
                        id: id,
                        firstAppName: firstAppName ?? "",
                        createAccount: createAccount ?? "",
                        moderationStatus: moderationStatus ?? "",
                        updateType: updateType ?? "",
                        newAppName: newAppName ?? "",
                        localizations: localizations,
                        creoLink: creoLink ?? "",
                        message: message ?? "",
                        isDone: isDone ?? false
                    )
                )
            }
            self.tasksCRList = array
            self.objectWillChange.send()
        }
    }
    
    func getTasksASOList(){
        FirebaseServices().getDocuments(collection: TaskDB.aso.rawValue) { docs in
            var array: [TaskAsoMobileModel] = []
                        
            docs.forEach{doc in
                let id = doc.documentID
                let appLink = doc["appLink"] as? String
                let keys = doc["keys"] as? [String]
                let isDone = doc["isDone"] as? Bool
                array.append(
                    TaskAsoMobileModel(
                        id: id,
                        appLink: appLink ?? "",
                        keys: keys ?? [],
                        isDone: isDone ?? false
                    )
                )
            }
            self.tasksASOList = array
            self.objectWillChange.send()
        }
    }
    
    func getTasksWEBList(){
        FirebaseServices().getDocuments(collection: TaskDB.web.rawValue) { docs in
            var array: [TaskWebViewModel] = []
                        
            docs.forEach{doc in
                let id = doc.documentID
                let appId = doc["appId"] as? String
                let newAppName = doc["newAppName"] as? String
                let firstAppName = doc["firstAppName"] as? String
                let createAccount = doc["createAccount"] as? String
                let transferAccount = doc["transferAccount"] as? String
                let creoLink = doc["creoLink"] as? String
                let webviewDomain = doc["webviewDomain"] as? String
                let devComp = doc["devComp"] as? String
                let isDone = doc["isDone"] as? Bool
                
                array.append(
                    TaskWebViewModel(
                        id: id,
                        appId: appId ?? "",
                        newAppName: newAppName ?? "",
                        firstAppName: firstAppName ?? "",
                        createAccount: createAccount ?? "",
                        transferAccount: transferAccount ?? "",
                        creoLink: creoLink ?? "",
                        webviewDomain: webviewDomain ?? "",
                        devComp: devComp ?? "",
                        isDone: isDone ?? false
                    )
                )
            }
            self.tasksWEBList = array
            self.objectWillChange.send()
        }
    }
    
    
    
    func getTasksTRList(){
        FirebaseServices().getDocuments(collection: TaskDB.tr.rawValue) { docs in
            var array: [TaskTransferModel] = []
                        
            docs.forEach{doc in
                let id = doc.documentID
                let appId = doc["appId"] as? String
                let createAccountName = doc["createAccountName"] as? String
                let createAccountCompany = doc["createAccountCompany"] as? String
                let createAccountIdentifier = doc["createAccountIdentifier"] as? String
                let createAccountToken = doc["createAccountToken"] as? String
                let transferAccountName = doc["transferAccountName"] as? String
                let transferAccountCompany = doc["transferAccountCompany"] as? String
                let transferAccountIdentifier = doc["transferAccountIdentifier"] as? String
                let transferAccountToken = doc["transferAccountToken"] as? String
                let isDone = doc["isDone"] as? Bool
                
                array.append(
                    TaskTransferModel(
                        id: id,
                        appId: appId ?? "",
                        createAccountName: createAccountName ?? "",
                        createAccountCompany: createAccountCompany ?? "",
                        createAccountIdentifier: createAccountIdentifier ?? "",
                        createAccountToken: createAccountToken ?? "",
                        transferAccountName: transferAccountName ?? "",
                        transferAccountCompany: transferAccountCompany ?? "",
                        transferAccountIdentifier: transferAccountIdentifier ?? "",
                        transferAccountToken: transferAccountToken ?? "",
                        isDone: isDone ?? false
                    )
                )
            }
            self.tasksTRList = array
            self.objectWillChange.send()
        }
    }
    
    func updateAll() {
        getTasksFMList()
        getTasksRNList()
        getTasksCRList()
        getTasksASOList()
        getTasksWEBList()
        getTasksTRList()
    }
}
