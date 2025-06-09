//
//  MenuPageCode.swift
//  CreateApp
//
//  Created by Main on 18.05.2025.
//

import Foundation

struct MenuPageCode {
    var prefix: String
    var versions: [PageCodeProtocol]
    var version: PageCodeProtocol
    
    init(prefix: String) {
        self.prefix = prefix
        versions = [
            MenuPageCodeV1(prefix: prefix, appName: ""),
            MenuPageCodeV2(prefix: prefix, appName: ""),
            MenuPageCodeV3(prefix: prefix, appName: ""),
        ]
        version = versions[Int.random(in: 0..<versions.count)]
    }
    
    func getCode() -> Data {
        return version.getCode()
    }
}

struct OurMenuTitleText {
    var variants = [
        "Просмотрите наше меню",
        "Ознакомьтесь с нашим меню",
        "Посмотрите наше меню",
        "Изучите меню",
        "Просмотрите ассортимент блюд",
        "Ознакомьтесь с ассортиментом",
        "Взгляните на наше меню",
        "Ознакомьтесь с предложениями",
        "Посмотрите перечень блюд",
        "Ознакомьтесь с нашим выбором",
        "Изучите наше меню",
    ]
    
    func getText() -> String {
        variants[Int.random(in: 0..<variants.count)]
    }
}
