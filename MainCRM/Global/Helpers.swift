//
//  Helpers.swift
//  MainCRM
//
//  Created by Main on 13.03.2025.
//

import Foundation
import SwiftUI

struct Helpers {
    func sortAccountNames(accName1: String, accName2: String) -> Bool {
        guard let stringNumber1 = accName1.split(separator: "-").last else { return false }
        guard let stringNumber2 = accName2.split(separator: "-").last else { return false }
        guard let number1 = Int(stringNumber1) else { return false }
        guard let number2 = Int(stringNumber2) else { return false }
        return number1 < number2
    }
    
    func getItemColor(app: AppModel) -> Color {
        let status = ModerationStatus(rawValue: app.moderationStatus)
        switch status {
        case .created:
            return Color.sectionBG
        case .review:
            return Color.review
        case .approve:
            return Color.approve
        case .reject:
            return Color.red
        case .publish:
            return Color.blue
        default:
            return Color.sectionBG
        }
            
    }
    
    func getSectionImageName(number: Int) -> String {
        if number < 10 {
            return "0\(number).square"
        }
        return "\(number).square"
    }
    
    func getTimeCount(timestamp: Int?) -> String {
        guard let timestamp else { return "99д" }
        let now = Int(Date().timeIntervalSince1970)
        
        if now - timestamp < 60 {
            return "\(now - timestamp)с"
        } else if now - timestamp < 3600 {
            return "\((now - timestamp)/60)м"
        } else if now - timestamp < 86400*2 {
            return "\((now - timestamp)/3600)ч"
        }

        return "\((now - timestamp)/3600/24)д"
    }
    
    func getPlayStoreLinkURL(app: AppModel) -> URL? {
        let appNameLow = getAppStoreId(appName: app.firstAppName)
        let gpLink = "https://play.google.com/store/apps/details?id=com."
        if let link = URL(string: gpLink + appNameLow) {
            return link
        }
        return nil
    }
    
    func getPlayStoreLinkString(app: AppModel) -> String {
        return "https://play.google.com/store/apps/details?id=com." + getAppStoreId(appName: app.firstAppName)
    }
    
    func getAppStoreId(appName: String) -> String {
        return String(appName.filter { !" \n\t\r".contains($0) }).lowercased()
    }
}
