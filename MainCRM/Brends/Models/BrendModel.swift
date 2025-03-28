//
//  BrendModel.swift
//  MainCRM
//
//  Created by Main on 27.03.2025.
//

import Foundation

struct BrendModel: Identifiable {
    var id: String
    var name: String
    var alias: String?
    var countries: [Countries]?
    var localizations: [Localizations]?
}
