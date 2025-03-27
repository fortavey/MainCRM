//
//  ASOSearchView.swift
//  MainCRM
//
//  Created by Main on 25.03.2025.
//

import SwiftUI

struct ASOSearchView: View {
    var body: some View {
        VStack{
            Text("Поиск по выдаче Google Play")
                .font(.title)
            
           
            HStack{
                VStack{
                    GooglePlaySearchLink(name: "Plinko", country: .IT, lang: .it)
                    GooglePlaySearchLink(name: "Plinko", country: .FR, lang: .fr)
                    Divider()
                    GooglePlaySearchLink(name: "Fortune Rabbit", country: .BR, lang: .ptBr)
                    Divider()
                    GooglePlaySearchLink(name: "Fortune Tiger", country: .BR, lang: .ptBr)
                    Divider()
                    GooglePlaySearchLink(name: "Fortune Dragon", country: .BR, lang: .ptBr)
                    Divider()
                    GooglePlaySearchLink(name: "Sweet Bonanza", country: .TR, lang: .tr)
                    GooglePlaySearchLink(name: "Sweet Bonanza", country: .DE, lang: .de)
                    GooglePlaySearchLink(name: "Sweet Bonanza", country: .FR, lang: .fr)
                }
                VStack{
                    GooglePlaySearchLink(name: "Chicken Road", country: .PL, lang: .pl)
                    GooglePlaySearchLink(name: "Chicken Road", country: .IN, lang: .enIn)
                    GooglePlaySearchLink(name: "Chicken Road Game", country: .PL, lang: .pl)
                    GooglePlaySearchLink(name: "Chicken Road Game", country: .IN, lang: .enIn)
                    Divider()
                    GooglePlaySearchLink(name: "Aviator", country: .IN, lang: .enIn)
                    Divider()
                    GooglePlaySearchLink(name: "Parimatch", country: .IN, lang: .enIn)
                    Divider()
                    GooglePlaySearchLink(name: "Goldbet", country: .IT, lang: .it)
                    Divider()
                    GooglePlaySearchLink(name: "Betflag", country: .IT, lang: .it)
                }
                VStack{
                    GooglePlaySearchLink(name: "Bahsegel", country: .TR, lang: .tr)
                    Divider()
                    GooglePlaySearchLink(name: "7slots", country: .TR, lang: .tr)
                    GooglePlaySearchLink(name: "7games", country: .BR, lang: .ptBr)
                    Divider()
                    GooglePlaySearchLink(name: "BetOnRed", country: .IT, lang: .it)
                    GooglePlaySearchLink(name: "BetOnRed", country: .ES, lang: .esEs)
                    Divider()
                    GooglePlaySearchLink(name: "Лаки джет", country: .RU, lang: .ru)
                    GooglePlaySearchLink(name: "Lucky jet", country: .IN, lang: .en)
                    GooglePlaySearchLink(name: "Lucky jet", country: .IN, lang: .enIn)
                    GooglePlaySearchLink(name: "Lucky jet", country: .CO, lang: .esLa)
                    Divider()
                    GooglePlaySearchLink(name: "Stake", country: .IN, lang: .en)
                    GooglePlaySearchLink(name: "Stake", country: .IN, lang: .enIn)
                }
            }
            
            
            Spacer()
        }
        .padding()
    }
}


struct GooglePlaySearchLink: View {
    var name: String
    var country: Countries
    var lang: Localizations
    
    var body: some View {
        HStack {
            Text(name)
                .font(.title3)
            
            if let link = URL(string: "https://play.google.com/store/search?q=\(getStringForSearch())&c=apps&hl=\(lang.rawValue)&gl=\(country)") {
                Link(destination: link) {
                    Text(country.rawValue)
                }
            }
            Spacer()
        }
    }
    
    func getStringForSearch() -> String {
        return name.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)

    }
}
