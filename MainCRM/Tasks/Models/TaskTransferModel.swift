//
//  TaskTransferModel.swift
//  MainCRM
//
//  Created by Main on 25.03.2025.
//

import Foundation

struct TaskTransferModel: Identifiable {
    var id: String
    var appId: String
    var createAccountName: String
    var createAccountCompany: String
    var createAccountIdentifier: String
    var createAccountToken: String
    var transferAccountName: String
    var transferAccountCompany: String
    var transferAccountIdentifier: String
    var transferAccountToken: String
    var isDone: Bool
}
