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
    
    func getAppStoreId(appName: String) -> String {
        return String(appName.filter { !" \n\t\r".contains($0) }).lowercased()
    }
}
