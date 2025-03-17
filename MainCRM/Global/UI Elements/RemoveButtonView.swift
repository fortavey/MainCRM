//
//  RemoveButtonView.swift
//  MainCRM
//
//  Created by Main on 14.03.2025.
//

import SwiftUI

struct RemoveButtonView: View {
    @State private var isPresentedAlert = false
    var title: String
    var id: String
    var collection: String
    var completion: () -> Void
    
    var body: some View {
        Button {
            isPresentedAlert = true
        } label: {
            Image(systemName: "xmark.circle")
                .foregroundStyle(Color.red)
        }
        .buttonStyle(.plain)
        .alert("Вы уверенны что хотите удалить \(title)", isPresented: $isPresentedAlert) {
            HStack{
                Button("Да") {
                    FirebaseServices().removeDocument(id: id, collection: collection) { res in
                        if res {
                            completion()
                            isPresentedAlert = false
                        }
                    }
                }
                Button("Нет") { isPresentedAlert = false }
            }
        }
    }
}
