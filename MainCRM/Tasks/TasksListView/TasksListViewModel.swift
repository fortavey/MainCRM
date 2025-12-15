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
    case to = "taskturnon"
    case lo = "tasklocal"
    case web = "taskwebview"
    case tr = "tasktransfer"
}

final class TasksListViewModel: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    var tasksFMList: [TaskFirstModerationModel] = []
    var tasksRNList: [TaskRenameModel] = []
    var tasksTOList: [TaskTurnOnModel] = []
    var tasksLOList: [TaskLocalModel] = []
    var tasksWEBList: [TaskWebViewModel] = []
    var tasksTRList: [TaskTransferModel] = []
    
    func isSomeTaskDone() -> Bool {
        let fm = tasksFMList.contains{ $0.isDone }
        let rn = tasksRNList.contains{ $0.isDone }
        let to = tasksTOList.contains{ $0.isDone }
        let lo = tasksLOList.contains{ $0.isDone }
        let web = tasksWEBList.contains{ $0.isDone }
        let tr = tasksTRList.contains{ $0.isDone }
        
        return fm || rn || to || lo || web || tr
    }
    
    func getTaskType(id: String) -> String? {
        let fm = tasksFMList.contains{ $0.id == id }
        let rn = tasksRNList.contains{ $0.id == id }
        let to = tasksTOList.contains{ $0.id == id }
        let lo = tasksLOList.contains{ $0.id == id }
        let web = tasksWEBList.contains{ $0.id == id }
        let tr = tasksTRList.contains{ $0.id == id }
        
        if fm { return TaskDB.fm.rawValue }
        if rn { return TaskDB.rn.rawValue }
        if to { return TaskDB.to.rawValue }
        if lo { return TaskDB.lo.rawValue }
        if web { return TaskDB.web.rawValue }
        if tr { return TaskDB.tr.rawValue }
        
        return nil
        
    }
    
    func isTaskExists(id: String) -> Bool{
        let fm = tasksFMList.contains{ $0.id == id }
        let rn = tasksRNList.contains{ $0.id == id }
        let to = tasksTOList.contains{ $0.id == id }
        let lo = tasksLOList.contains{ $0.id == id }
        let web = tasksWEBList.contains{ $0.id == id }
        let tr = tasksTRList.contains{ $0.id == id }
        
        return fm || rn || to || lo || web || tr
    }
    
    func isTaskDone(id: String) -> Bool? {
        if let task = tasksFMList.first(where: {$0.id == id}) {
            return task.isDone
        } else if let task = tasksRNList.first(where: {$0.id == id}) {
            return task.isDone
        } else if let task = tasksTOList.first(where: {$0.id == id}) {
            return task.isDone
        } else if let task = tasksLOList.first(where: {$0.id == id}) {
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
    
    func getTasksTOList(){
        FirebaseServices().getDocuments(collection: TaskDB.to.rawValue) { docs in
            var array: [TaskTurnOnModel] = []
                        
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
                    TaskTurnOnModel(
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
            self.tasksTOList = array
            self.objectWillChange.send()
        }
    }
    
    func getTasksASOList(){
        FirebaseServices().getDocuments(collection: TaskDB.lo.rawValue) { docs in
            var array: [TaskLocalModel] = []
                        
            docs.forEach{doc in
                let id = doc.documentID
                let appLink = doc["appLink"] as? String
                let keys = doc["keys"] as? [String]
                let isDone = doc["isDone"] as? Bool
                array.append(
                    TaskLocalModel(
                        id: id,
                        appLink: appLink ?? "",
                        keys: keys ?? [],
                        isDone: isDone ?? false
                    )
                )
            }
            self.tasksLOList = array
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
                let devLink = doc["devLink"] as? String
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
                        devLink: devLink ?? "",
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
        getTasksTOList()
        getTasksASOList()
        getTasksWEBList()
        getTasksTRList()
    }
}
