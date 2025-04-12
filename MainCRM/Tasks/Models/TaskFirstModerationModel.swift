//
//  TaskFirstModerationModel.swift
//  MainCRM
//
//  Created by Main on 18.03.2025.
//

import Foundation

struct TaskFirstModerationModel: Identifiable {
    var id: String
    var firstAppName: String
    var createAccount: String
    var moderationStatus: String
    var updateType: String
    var driveLink: String
    var isDone: Bool
    var message: String
    var timestamp: Double
}
