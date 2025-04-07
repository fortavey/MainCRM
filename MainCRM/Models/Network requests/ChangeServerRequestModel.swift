//
//  ChangeServerRequestModel.swift
//  MainCRM
//
//  Created by Main on 06.04.2025.
//

import Foundation

struct ChangeServerRequestModel: Codable {
    var token: String = MainConfig.token
    var string: String
    var fileName: String
}
