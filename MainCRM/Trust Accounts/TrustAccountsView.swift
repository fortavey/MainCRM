//
//  TrustAccountsView.swift
//  MainCRM
//
//  Created by Main on 08.03.2025.
//

import SwiftUI
import FirebaseFirestore

struct TrustAccountsView: View {
    @EnvironmentObject private var trustAccountsVM: TrustAccountsViewModel
    @State private var isRemoveMode = false
    @State private var isPresented = false
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack{
                    Button{
                        isPresented.toggle()
                    } label: {
                        MenuIconView(systemName: "plus.circle.fill")
                    }
                    .sheet(isPresented: $isPresented) {
                        AddNewTrustAccount(isPresented: $isPresented, trustAccountsVM: trustAccountsVM)
                    }
                    Button {
                        isRemoveMode.toggle()
                    } label: {
                        MenuIconView(systemName: "trash.circle.fill")
                            .foregroundStyle(isRemoveMode ? Color.red : Color.white)
                    }
                    Spacer()
                    Button {
                        trustAccountsVM.getAccountsList()
                    } label: {
                        MenuIconView(systemName: "arrow.clockwise.circle.fill")
                    }
                }
                
                List(trustAccountsVM.accountsList){ acc in
                    HStack{
                        if isRemoveMode {
                            RemoveButtonView(title: acc.alias, id: acc.id, collection: "trust") {
                                trustAccountsVM.getAccountsList()
                            }
                        }
                        LineItemView(text: acc.alias, width: 100)
                        LineItemView(text: acc.company, width: 150)
                        LineItemView(text: acc.email, width: 200)
                        LineItemView(text: acc.developerId, width: 200)
                        LineItemView(text: acc.transactionId, width: 200)
                        AccBanButton(acc: acc)
                        if acc.isKeyExist {
                            Image(systemName: "key.fill")
                                .foregroundStyle(Color.green)
                        }
                    }
                }
            }
            .padding()
        }
    }
}

