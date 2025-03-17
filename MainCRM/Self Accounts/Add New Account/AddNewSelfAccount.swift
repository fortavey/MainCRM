//
//  AddNewAccount.swift
//  MainCRM
//
//  Created by Main on 11.03.2025.
//

import SwiftUI
import FirebaseFirestore

struct AddNewSelfAccount: View {
    @State private var alias = ""
    @State private var company = ""
    @State private var email = ""
    @State private var developerId = ""
    @State private var transactionId = ""
        
    @Binding var isPresented: Bool
    
    @ObservedObject var selfAccountsVM: SelfAccountsViewModel
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button {
                    isPresented = false
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
            TextField("Компания", text: $company)
            TextField("Почта", text: $email)
            TextField("ID разработчика", text: $developerId)
            TextField("ID транзакции", text: $transactionId)
           
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
            .collection("self")
            .document()
            .setData([
                "alias": alias,
                "company": company,
                "email": email,
                "developerId": developerId,
                "transactionId": transactionId,
            ], merge: true) { err in
                if err == nil {
                    print("Saved")
                    selfAccountsVM.getAccountsList()
                    isPresented = false
                }else{
                    print("ERR", err!)
                }
            }
    }
}
