//
//  CreateAppCombineViewModel.swift
//  MainCRM
//
//  Created by Main on 25.05.2025.
//

import Foundation
import Combine

enum FConfig {
    static let mainDir = "/Users/Main/NewApps"
    static let imagesPath = "/Users/Main/Documents/products"
    static let backgroundsPath = "/Users/Main/Documents/backgrounds"
    static let logosPath = "/Users/Main/Documents/logos"
    static let successPath = "/Users/Main/Documents/success"
}

final class CreateAppCombineViewModel: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    var appPrefix: String = ""
    var appRealName: String = ""
    var appName: String {
        appRealName.removeSpaces()
    }
    var pathToApp: String {
        "\(FConfig.mainDir)/\(appName)"
    }
    var assetsPath: String {
        "\(pathToApp)/src/\(appPrefix.lowercased())_assets"
    }
    var imagessPath: String {
        "\(pathToApp)/src/\(appPrefix.lowercased())_assets/images"
    }
    var configsPath: String {
        "\(pathToApp)/src/\(appPrefix.lowercased())_configs"
    }
    var screensPath: String {
        "\(pathToApp)/src/\(appPrefix.lowercased())_screens"
    }
}

class Helper {
    static var shared = Helper()
    var randomProducts: [Int] = []
    var ext: String = "txt"
    private init(){
        refreshProducts()
    }
    
    func refreshProducts() {
        self.randomProducts = []
        var tempArray: [Int] = []
        while tempArray.count < 10 {
            let random = Int.random(in: 1...183)
            if !tempArray.contains(random) {
                tempArray.append(random)
            }
        }
        self.randomProducts = tempArray
    }
    
    func getLogoPath(appName: String, lower: String) -> String {
        let mainPath = "\(FConfig.mainDir)/\(appName.removeSpaces())"
        if FileManager.default.fileExists(atPath: "\(mainPath)/assets/\(lower)_logo.png") {
            return "../\(lower)_assets/\(lower)_logo.png"
        }
        if FileManager.default.fileExists(atPath: "\(mainPath)/assets/\(lower)_logo.jpg") {
            return "../\(lower)_assets/\(lower)_logo.jpg"
        }
        return ""
    }
    
    func getRandomString(str: String) -> String {
        if Int.random(in: 0...20) > 10 {
            return str
        }
        else {
            return ""
        }
    }
}
