//
//  ChooseCountryButtonView.swift
//  MainCRM
//
//  Created by Main on 21.03.2025.
//

import SwiftUI

struct ChooseCountryButtonView: View {
    @State private var isPresented: Bool = false
    @State private var showingPopover = false
    var app: AppModel
    
    
    var body: some View {
        Button {
            isPresented = true
        } label: {
            if let countries = app.countries {
                if countries.isEmpty {
                    LineItemView(text: "Выбор стран", width: 100)
                }else {
                    LineItemView(text: "\(countries[0]), ...", width: 100)
                        .onHover { bool in
                            showingPopover = bool
                        }
                        .popover(isPresented: $showingPopover) {
                            VStack(alignment: .leading){
                                ForEach(countries.indices) { index in
                                    Text(countries[index])
                                        .padding(.vertical, 2)
                                        .padding(.horizontal, 10)
                                }
                            }
                            .padding()
                        }
                }
            }else {
                LineItemView(text: "Выбор стран", width: 100)
            }
            
        }
        .sheet(isPresented: $isPresented) {
            ChooseCountrySheetView(app: app, isPresented: $isPresented)
        }
        
            
    }
}

struct ChooseCountrySheetView: View {
    @EnvironmentObject private var appListVM: AppListViewModel
    @Binding var isPresented: Bool
    @State private var countries: [String] = []
    var app: AppModel
    var index = 1
    
    init(app: AppModel, isPresented: Binding<Bool>) {
        self.app = app
        _isPresented = isPresented
        if let countriesArray = app.countries {
            self._countries = State(initialValue: countriesArray)
        }
    }
    
    var body: some View {
        VStack {
            Text("Выберите страны для доступа")
                .font(.title)
            
            ScrollView {
                Grid(alignment: .leading) {
                    ForEach(Countries.allCases, id: \.rawValue) { country in
                        HStack{
                            OneCountryView(countryName: country.rawValue, countries: $countries)
                        }
                    }
                }
                .padding()
            }
            .frame(height: 600)
            HStack{
                Button("Отмена") {
                    isPresented = false
                }
                Button("Сохранить") {
                    FirebaseServices().updateDocument(id: app.id, collection: "apps", fields: ["countries": countries]) { result in
                        if result {
                            appListVM.getAppsList()
                            isPresented = false
                        }else {
                            print("Ошибка обновления")
                        }
                    }
                }
            }
            .padding()

        }
        .padding()
    }
}
