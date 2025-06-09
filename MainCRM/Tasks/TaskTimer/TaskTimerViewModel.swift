//
//  TaskTimerViewModel.swift
//  MainCRM
//
//  Created by Main on 09.06.2025.
//

import Combine
import FirebaseFirestore

final class TaskTimerViewModel: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    var brendsList: [BrendModel] = []
    
    func getTimersList(){
        
    }
    
    func isLoad() -> Bool{
        return brendsList.count > 0
    }
    
}
