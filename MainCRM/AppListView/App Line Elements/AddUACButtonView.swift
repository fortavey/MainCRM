//
//  AddUACButtonView.swift
//  MainCRM
//
//  Created by Main on 05.08.2025.
//

import SwiftUI

struct AddUACButtonView: View {
    @State private var isDisabled = true
    var app: AppModel
    
    var body: some View {
        Button("UAC"){
            addUAC()
        }
        .disabled(isDisabled)
        .onAppear(){
            changeDisabled()
        }
    }
    
    func changeDisabled(){
        if let isUAC = app.isUAC {
            isDisabled = isUAC
        }else {
            isDisabled = false
        }
    }
    
    func addUAC(){
        FirebaseServices().updateDocument(id: app.id,
                                          collection: "apps",
                                          fields: ["isUAC": true]
        ) { result in
            if result {
                isDisabled = true
            }else {
                print("Ошибка обновления")
            }
        }
    }
}
