//
//  TrustAccountModel.swift
//  MainCRM
//
//  Created by Main on 11.03.2025.
//

import Foundation

struct TrustAccountModel: Identifiable {
    var id: String
    var alias: String
    var company: String
    var email: String
    var developerId: String
    var transactionId: String
    var isKeyExist: Bool
}
