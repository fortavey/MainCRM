//
//  AppModel.swift
//  MainCRM
//
//  Created by Main on 13.03.2025.
//

import Foundation

struct AppModel: Identifiable {
    var id: String
    var devComp: String
    var firstAppName: String
    var devLink: String
    var createAccount: String
    var moderationStatus: String
    var moderationChangeTime: Date
    var updateType: String
    var newAppName: String
    var localizations: [String]?
    var storeLink: String
    var driveLink: String
    var creoLink: String?
    var isBan: Bool?
}
