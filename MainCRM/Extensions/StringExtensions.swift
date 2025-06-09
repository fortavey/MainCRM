//
//  StringExtensions.swift
//  MainCRM
//
//  Created by Main on 25.05.2025.
//

import Foundation

extension String {
    func removeSpaces() -> String {
        return self.replacingOccurrences(of: " ", with: "")
    }
}
