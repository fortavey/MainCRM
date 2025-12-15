//
//  TaskAsoMobileModel.swift
//  MainCRM
//
//  Created by Main on 23.03.2025.
//

import Foundation

struct TaskLocalModel: Identifiable {
    var id: String
    var appLink: String
    var keys: [String]
    var isDone: Bool
}
