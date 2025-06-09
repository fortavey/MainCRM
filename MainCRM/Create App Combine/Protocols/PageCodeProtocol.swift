//
//  PageCodeProtocol.swift
//  CreateApp
//
//  Created by Main on 19.05.2025.
//

import Foundation

protocol PageCodeProtocol {
    var prefix: String { get }
    var appName: String { get }
    var lower: String { get }
    var code: String { get }
    func getCode() -> Data
}
