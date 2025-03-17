//
//  TrustAccountViewModel.swift
//  MainCRM
//
//  Created by Main on 11.03.2025.
//

import Foundation
import Combine
import FirebaseFirestore

final class TrustAccountsViewModel: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    var accountsList: [TrustAccountModel] = []
    
    func getAccountsList(){
        FirebaseServices().getDocuments(collection: "trust") { docs in
            var array: [TrustAccountModel] = []
            
            docs.forEach{doc in
                let id = doc.documentID
                let alias = doc["alias"] as? String
                let company = doc["company"] as? String
                let email = doc["email"] as? String
                let developerId = doc["developerId"] as? String
                let transactionId = doc["transactionId"] as? String
                let isKeyExist = doc["isKeyExist"] as? Bool
                array.append(
                    TrustAccountModel(
                        id: id,
                        alias: alias ?? "",
                        company: company ?? "",
                        email: email ?? "",
                        developerId: developerId ?? "",
                        transactionId: transactionId ?? "",
                        isKeyExist: isKeyExist ?? false
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
