//
//  ConfigsCode.swift
//  CreateApp
//
//  Created by Main on 17.05.2025.
//

import Foundation

struct ColorsCode {
    var dark: String
    var lightDark: String
    var light: String
}

struct ConfigsCode {
    var prefix: String
    var code: String
    var colors: [ColorsCode] = [
        ColorsCode(dark: "#0B3D91", lightDark: "#3A6EA5", light: "#A9CCE3"),
        ColorsCode(dark: "#1B4D3E", lightDark: "#3A7D63", light: "#A8D5BA"),
        ColorsCode(dark: "#7B3F00", lightDark: "#B36B00", light: "#FFDDA5"),
        ColorsCode(dark: "#3D1766", lightDark: "#6B44A1", light: "#CBB7E9"),
        ColorsCode(dark: "#4B2E05", lightDark: "#85692A", light: "#DCC88A"),
        ColorsCode(dark: "#2F3E46", lightDark: "#55687A", light: "#A9BCCB"),
        ColorsCode(dark: "#7B1010", lightDark: "#B83232", light: "#E89A9A"),
        ColorsCode(dark: "#0F4C4C", lightDark: "#3D8B8B", light: "#A9DAD9"),
        ColorsCode(dark: "#8B4000", lightDark: "#C26A00", light: "#FFD68A"),
        ColorsCode(dark: "#121B3A", lightDark: "#364B8B", light: "#A3B8F0"),
    ]
    var randomColorShema: ColorsCode
    
    init(prefix: String) {
        self.prefix = prefix
        self.randomColorShema = colors[Int.random(in: 0...colors.count - 1)]
        code = """
const colors = {
    dark: '\(randomColorShema.dark)',
    lightDark: '\(randomColorShema.lightDark)',
    light: '\(randomColorShema.light)'
}

export default colors
"""
    }
        
    func getCode() -> Data {
        return code.data(using: .utf8)!
    }
}
