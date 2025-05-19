//
//  TrustAccountsView.swift
//  MainCRM
//
//  Created by Main on 08.03.2025.
//

import SwiftUI
import FirebaseFirestore

struct SelfAccountsView: View {
    @EnvironmentObject private var selfAccountsVM: SelfAccountsViewModel
    @EnvironmentObject private var appListVM: AppListViewModel
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
                        AddNewSelfAccount(isPresented: $isPresented, selfAccountsVM: selfAccountsVM)
                    }
                    Button {
                        isRemoveMode.toggle()
                    } label: {
                        MenuIconView(systemName: "trash.circle.fill")
                            .foregroundStyle(isRemoveMode ? Color.red : Color.white)
                    }
                    Spacer()
                    Button {
                        selfAccountsVM.getAccountsList()
                    } label: {
                        MenuIconView(systemName: "arrow.clockwise.circle.fill")
                    }
                }
                
                List(selfAccountsVM.accountsList){ acc in
                    HStack{
                        if isRemoveMode {
                            RemoveButtonView(title: acc.alias, id: acc.id, collection: "self") {
                                selfAccountsVM.getAccountsList()
                            }
                        }
                        LineItemView(text: acc.alias, width: 100)
                        LineItemView(text: acc.company, width: 150)
                        LineItemView(text: acc.email, width: 200)
                        LineItemView(text: acc.developerId, width: 200)
                        LineItemView(text: acc.transactionId, width: 200)
                        
                        
                        
                        if let app = appListVM.appsList.first(where: { $0.transferAccount == acc.alias }){
                            // Ссылка на аккаунт в GooglePlay
                            if let link = URL(string: getAccountLink(accountCompanyName: acc.company)) {
                                Link(destination: link) {
                                    Image("GooglePlayIcon")
                                        .resizable()
                                        .frame(width: 17, height: 17)
                                }
                            }
                            if(app.isBan == true) {
                                Text("БАН")
                            }
                        }
                    }
                }
            }
            .padding()
        }
    }
    
    func getAccountLink(accountCompanyName: String) -> String {
        let newString = accountCompanyName.replacingOccurrences(of: " ", with: "+")
        return "https://play.google.com/store/apps/developer?id=\(newString)"
    }
}

