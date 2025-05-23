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
    var transferAccount: String?
    var moderationStatus: String
    var moderationChangeTime: Int
    var updateType: String
    var newAppName: String
    var localizations: [String]?
    var storeLink: String
    var driveLink: String
    var creoLink: String?
    var isBan: Bool?
    var webviewDomain: String?
    var countries: [String]?
    var isAsoMobile: Bool?
    var isTransfer: Bool?
    var isRenamed: Bool?
    var renameVersion: Int?
    var lastUpdateTime: String?
    var isUACReady: Bool?
    var isAppBaned: Bool?
    
    mutating func changeIsAppBanned(_ value: Bool?) {
        self.isAppBaned = value
    }
}
