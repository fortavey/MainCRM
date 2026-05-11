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
    @State private var isPresentedS = false
    
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
                    Button{
                        isPresentedS.toggle()
                    } label: {
                        MenuIconView(systemName: "plus.rectangle.fill.on.rectangle.fill")
                    }
                    .sheet(isPresented: $isPresentedS) {
                        AddNewSelfAccounts(selfAccountsVM: selfAccountsVM, isPresentedS: $isPresentedS)
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
                        
                        SelfAccountItemView(acc: acc)
                        
                        
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

struct SelfAccountItemView: View {
    var acc: SelfAccountModel
    @State private var isGoToTrustAccount = false
    
    var body: some View {
        HStack{
            LineItemView(text: acc.alias, width: 100)
            LineItemView(text: acc.company, width: 150)
            LineItemView(text: acc.email, width: 200)
            LineItemView(text: acc.developerId, width: 200)
            LineItemView(text: acc.transactionId, width: 200)
            
            Button("Перенос в A.TRUST"){
                isGoToTrustAccount = true
            }
            .sheet(isPresented: $isGoToTrustAccount) {
                GoToTrustAccount(company: acc.company, email: acc.email, developerId: acc.developerId, transactionId: acc.transactionId, isGoToTrustAccount: $isGoToTrustAccount)
            }
        }
    }
}


struct GoToTrustAccount: View {
    @State private var alias = ""
    var company: String
    var email: String
    var developerId: String
    var transactionId: String
    var isKeyExist = false
        
    @Binding var isGoToTrustAccount: Bool
        
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button {
                    isGoToTrustAccount = false
                } label: {
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                .buttonStyle(.plain)
            }

            Text("Добавить новый аккаунт")
                .padding()
                .font(.title)
            TextField("Название профиля", text: $alias)
            Text("Компания - \(company)")
            Text("Почта - \(email)")
            Text("ID разработчика - \(developerId)")
            Text("ID транзакции - \(transactionId)")
                .toggleStyle(.checkbox)
            Button {
                addNewAccount()
            } label: {
                Text("Добавить")
                    .padding(5)
            }
            .padding(.top, 30)
            .disabled(!isValid())
            
            Spacer()
        }
        .frame(width: 500)
        .padding()
    }
    
    private func isValid() -> Bool{
        if alias != "" && company != "" && email != "" && developerId != "" && transactionId != "" {
            return true
        }
        return false
    }
    
    private func addNewAccount(){
        Firestore.firestore()
            .collection("trust")
            .document()
            .setData([
                "alias": alias,
                "company": company,
                "email": email,
                "developerId": developerId,
                "transactionId": transactionId,
                "isKeyExist": isKeyExist
            ], merge: true) { err in
                if err == nil {
                    isGoToTrustAccount = false
                }else{
                    print("ERR")
                }
            }
    }
}
