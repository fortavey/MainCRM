//
//  BrendsListView.swift
//  MainCRM
//
//  Created by Main on 27.03.2025.
//

import SwiftUI
import FirebaseFirestore

struct BrendsListView: View {
    @EnvironmentObject private var brendListVM: BrendListViewModel
    @State private var isPresented = false
    @State private var brendsList: [BrendModel] = []
    
    var body: some View {
        VStack{
            HStack{
                Button{
                    isPresented.toggle()
                }label: {
                    MenuIconView(systemName: "plus.circle.fill")
                        .contextMenu {
                            Text("Добавить бренд")
                        }
                }
                
                Spacer()
            }
            .padding()
            .sheet(isPresented: $isPresented) {
                AddBrandSheetView(isPresented: $isPresented, brendsList: $brendsList)
            }
            
            List(brendListVM.brendsList, id: \.id) { brend in
               
                HStack {
                    LineItemView(text: brend.name, width: 150)
                    LineItemView(text: brend.alias ?? "", width: 150)
                    if let arr = brend.countries, arr.count > 0 {
                        LineItemView(text: "\(arr[0].rawValue)...", width: 150)
                    }else {
                        LineItemView(text: "Все страны", width: 150)
                    }
                   
                }
            }
            
            Spacer()
        }
    }
}

struct AddBrandSheetView: View {
    @EnvironmentObject private var brendListVM: BrendListViewModel
    @State private var countries: [Countries] = []
    @State private var languages: [Localizations] = []
    @State private var name: String = ""
    @State private var alias: String = ""
    @Binding var isPresented: Bool
    @Binding var brendsList: [BrendModel]
    
    var body: some View {
        VStack{
            Text("Добавление нового бренда")
                .font(.title)
            
            TextField("Название", text: $name)
            TextField("Алиас", text: $alias)
            
            HStack{
                ScrollView {
                    Grid(alignment: .leading) {
                        ForEach(Countries.allCases, id: \.rawValue) { country in
                            HStack{
                                OneBrendCountryView(country: country, countries: $countries)
                            }
                        }
                    }
                    .padding()
                }
                .frame(height: 500)
                
                ScrollView {
                    Grid(alignment: .leading) {
                        ForEach(Localizations.allCases, id: \.rawValue) { language in
                            HStack{
                                OneBrendLanguageView(language: language, languages: $languages)
                            }
                        }
                    }
                    .padding()
                }
                .frame(height: 500)
            }
            HStack{
                Button("Отмена") {
                    isPresented = false
                }
                Button("Добавить") {
                    sendAddBrendRequest(newBrend: BrendModel(id: UUID().uuidString, name: name, alias: alias, countries: countries, localizations: languages))
                    isPresented = false
                }
            }
            .padding()
        }
        .padding()
    }
    
    private func sendAddBrendRequest(newBrend: BrendModel) {
        var countriesArray: [String] = []
        var localizationsArray: [String] = []
        if let arrayCountries = newBrend.countries {
            countriesArray = arrayCountries.map{ $0.rawValue }
        }
        if let arrayLocalizations = newBrend.localizations {
            localizationsArray = arrayLocalizations.map{ $0.rawValue }
        }
        Firestore.firestore()
            .collection("brends")
            .document()
            .setData([
                "name": newBrend.name,
                "alias": newBrend.alias ?? "",
                "countries": countriesArray,
                "localizations": localizationsArray
                
            ], merge: true) { err in
                if err == nil {
                    print("Saved")
                    brendListVM.getBrendsList()
                    isPresented = false
                }else{
                    print("ERR")
                }
            }
    }
}


struct OneBrendCountryView: View {
    var country: Countries
    @Binding var countries: [Countries]
    @State private var toggleIsOn: Bool = false
    
    var body: some View {
        HStack{
            Toggle("", isOn: $toggleIsOn)
                .toggleStyle(.checkbox)
                .onChange(of: toggleIsOn) { oldValue, newValue in
                    if newValue {
                        if countries.contains(country) {  }
                        else { countries.append(country) }
                    }else {
                        countries = countries.filter{$0 != country}
                    }
                }
                .onAppear(){
                    if countries.contains(country) {
                        toggleIsOn = true
                    }
                }
            Text(country.rawValue)
        }
    }
    
    func isOn() -> Bool {
        if countries.contains(country) {
            return true
        }
        
        return false
    }
}



struct OneBrendLanguageView: View {
    var language: Localizations
    @Binding var languages: [Localizations]
    @State private var toggleIsOn: Bool = false
    
    var body: some View {
        HStack{
            Toggle("", isOn: $toggleIsOn)
                .toggleStyle(.checkbox)
                .onChange(of: toggleIsOn) { oldValue, newValue in
                    if newValue {
                        
                        if languages.contains(language) {  }
                        else {
                            languages.append(language)
                        }
                    }else {
                        languages = languages.filter{$0 != language}
                    }
                }
                .onAppear(){
                    if languages.contains(language) {
                        toggleIsOn = true
                    }
                }
            Text(language.title)
        }
    }
    
    func isOn() -> Bool {
        if languages.contains(language) {
            return true
        }
        
        return false
    }
}
