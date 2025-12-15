//
//  TaskCreoModel.swift
//  MainCRM
//
//  Created by Main on 18.03.2025.
//

import Foundation

struct TaskTurnOnModel: Identifiable {
    var id: String
    var firstAppName: String
    var createAccount: String
    var moderationStatus: String
    var updateType: String
    var newAppName: String
    var localizations: [String]?
    var creoLink: String
    var message: String
    var isDone: Bool
}
