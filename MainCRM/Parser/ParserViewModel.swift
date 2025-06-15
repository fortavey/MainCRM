//
//  ParserViewModel.swift
//  MainCRM
//
//  Created by Main on 14.06.2025.
//

import Foundation
import Combine
import FirebaseFirestore

final class ParserViewModel: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    var opacity: Double = 1
    
    func changeOpacity(){
        if opacity == 0 {
            opacity = 1
        }else {
            opacity = 0
        }
        self.objectWillChange.send()
    }
}
