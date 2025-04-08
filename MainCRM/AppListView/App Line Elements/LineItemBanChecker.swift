//
//  LineItemBanChecker.swift
//  MainCRM
//
//  Created by Main on 07.04.2025.
//

import SwiftUI

struct LineItemBanChecker: View {
    var app: AppModel
    @State private var isActive: Bool? = nil
    
    var body: some View {
        HStack{
            Button("Проверить"){
                PlayStoreBanRequest(app: app).fetch(handler: { isActive in
                    self.isActive = isActive
                })
            }
        }
        if let isActive {
            isActive ? Text("Норм") : Text("Бан")
        }else {
            Text("ХЗ")
        }
    }
}
