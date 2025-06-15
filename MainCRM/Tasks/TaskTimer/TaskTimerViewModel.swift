//
//  TaskTimerViewModel.swift
//  MainCRM
//
//  Created by Main on 09.06.2025.
//

import Combine
import FirebaseFirestore

struct TimerModel {
    var id: String
    var endTime: Int
    var isDone: Bool
}

final class TaskTimerViewModel: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    var timersList: [TimerModel] = []
    
    func getTimersList(){
        FirebaseServices().getDocuments(collection: "timers") { docs in
            var array: [TimerModel] = []
            
            docs.forEach{doc in
                let id = doc.documentID
                let endTime = doc["endTime"] as? Int
                let isDone = doc["isDone"] as? Bool
                
                array.append(
                    TimerModel(
                        id: id,
                        endTime: endTime ?? 0,
                        isDone: isDone ?? false
                    )
                )
            }
            self.timersList = array
            self.objectWillChange.send()
        }
    }
    
    func isLoad() -> Bool{
        return timersList.count > 0
    }
    
}
