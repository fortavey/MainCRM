//
//  SelfAccountsViewModel.swift
//  MainCRM
//
//  Created by Main on 13.03.2025.
//

import Foundation
import Combine
import FirebaseFirestore

final class SelfAccountsViewModel: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    var accountsList: [SelfAccountModel] = []
    
    func getAccountsList(){
        FirebaseServices().getDocuments(collection: "self") { docs in
            var array: [SelfAccountModel] = []
            
            docs.forEach{doc in
                let id = doc.documentID
                let alias = doc["alias"] as? String
                let company = doc["company"] as? String
                let email = doc["email"] as? String
                let developerId = doc["developerId"] as? String
                let transactionId = doc["transactionId"] as? String
                array.append(
                    SelfAccountModel(
                        id: id,
                        alias: alias ?? "",
                        company: company ?? "",
                        email: email ?? "",
                        developerId: developerId ?? "",
                        transactionId: transactionId ?? ""
                    )
                )
            }
            self.accountsList = array.sorted{ Helpers().sortAccountNames(accName1: $0.alias, accName2: $1.alias)}
            self.objectWillChange.send()
        }
    }
    
    func isLoad() -> Bool{
        return accountsList.count > 0
    }
}
