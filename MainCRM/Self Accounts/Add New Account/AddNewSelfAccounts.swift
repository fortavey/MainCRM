//
//  AddNewSelfAccounts.swift
//  MainCRM
//
//  Created by Main on 18.12.2025.
//


import SwiftUI
import FirebaseFirestore

struct AccountModelLocal: Identifiable {
    var id: String { alias }
    var alias: String
    var company: String
    var email: String
    var developerId: String
    var transactionId: String
}

struct AddNewSelfAccounts: View {
    @ObservedObject var selfAccountsVM: SelfAccountsViewModel
    @State private var accountsString: String = ""
    @State private var accounts: [AccountModelLocal] = []
    @Binding var isPresentedS: Bool
    
    var body: some View {
        VStack {
            HStack{
                Spacer()
                Button {
                    isPresentedS = false
                } label: {
                    Image(systemName: "xmark.circle")
                        .resizable()
                        .frame(width: 25, height: 25)
                }
                .buttonStyle(.plain)
            }
            if accounts.isEmpty {
                Button("Вставить строки из таблицы"){
                    let pasteboard = NSPasteboard.general
                    if let copiedString = pasteboard.string(forType: .string) {
                        let firstArr = getSplittedArr(str: copiedString)
                        firstArr.forEach{str in
                            let newStr = str.replacingOccurrences(of: "\n", with: "")
                            let secondArr = getAccountsArr(str: newStr)
                            accounts.append(AccountModelLocal(
                                alias: secondArr[0],
                                company: secondArr[1],
                                email: secondArr[2],
                                developerId: secondArr[3],
                                transactionId: secondArr[4]
                            ))
                        }
                    }
                    
                }
            }else {
                ScrollView{
                    ForEach(accounts) { acc in
                        AddNewSelfAccountCopy(account: acc, selfAccountsVM: selfAccountsVM, accounts: $accounts)
                    }
                }
            }
        }
        .padding()
    }
    
    func getAccountsArr(str: String) -> [String] {
        return str.split(separator: "\t").map(String.init)
    }
    
    func getSplittedArr(str: String) -> [String]{
        return str.split(separator: "***").map(String.init)
    }
}


struct AddNewSelfAccountCopy: View {
    var account: AccountModelLocal
    @ObservedObject var selfAccountsVM: SelfAccountsViewModel
    @Binding var accounts: [AccountModelLocal]
    
    var body: some View {
        VStack{

            Text("Добавить новый аккаунт")
                .padding()
                .font(.title)
            Text("Название профиля - " + account.alias)
            Text("Компания - " + account.company)
            Text("Почта - " + account.email)
            Text("ID разработчика - " + account.developerId)
            Text("ID транзакции - " + account.transactionId)
           
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
        if account.alias != "" && account.company != "" && account.email != "" && account.developerId != "" && account.transactionId != "" {
            return true
        }
        return false
    }
    
    private func addNewAccount(){
        Firestore.firestore()
            .collection("self")
            .document()
            .setData([
                "alias": account.alias,
                "company": account.company,
                "email": account.email,
                "developerId": account.developerId,
                "transactionId": account.transactionId,
            ], merge: true) { err in
                if err == nil {
                    print("Saved")
                    selfAccountsVM.getAccountsList()
                    accounts.removeFirst()
                }else{
                    print("ERR", err!)
                }
            }
    }
}
