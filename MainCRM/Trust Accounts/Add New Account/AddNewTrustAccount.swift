//
//  AddNewAccount.swift
//  MainCRM
//
//  Created by Main on 11.03.2025.
//

import SwiftUI
import FirebaseFirestore

struct AddNewTrustAccount: View {
    @State private var alias = ""
    @State private var company = ""
    @State private var email = ""
    @State private var developerId = ""
    @State private var transactionId = ""
    @State private var isKeyExist = false
        
    @Binding var isPresented: Bool
    
    @ObservedObject var trustAccountsVM: TrustAccountsViewModel
    
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
            Toggle("Ключи в наличии", isOn: $isKeyExist)
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
                    print("Saved")
                    trustAccountsVM.getAccountsList()
                    isPresented = false
                }else{
                    print("ERR", err)
                }
            }
    }
}
