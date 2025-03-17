//
//  FirebaseManager.swift
//  MainCRM
//
//  Created by Main on 11.03.2025.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class FirebaseManager {
    func registerNewUser(user: UserData){
        Auth.auth().createUser(withEmail: user.email, password: user.pass) { result, err in
            guard err == nil else {
                return
            }
            
            if let uid = result?.user.uid {
                Firestore.firestore()
                    .collection("users")
                    .document(uid)
                    .setData([
                        "email": user.email,
                        "name": user.name,
                        "age": Date(),
                        "isValid": false
                    ], merge: true) { err in
                        if err == nil {
                            print("Saved")
                        }else{
                            print("ERR")
                        }
                    }
            }
        }
    }
}

struct UserData {
    var name: String
    var email: String
    var pass: String
}
