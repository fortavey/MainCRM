//
//  OneCountryView.swift
//  MainCRM
//
//  Created by Main on 21.03.2025.
//

import SwiftUI

struct OneCountryView: View {
    var countryName: String
    @Binding var countries: [String]
    @State private var toggleIsOn: Bool = false
    
    var body: some View {
        HStack{
            Toggle("", isOn: $toggleIsOn)
                .toggleStyle(.checkbox)
                .onChange(of: toggleIsOn) { oldValue, newValue in
                    if newValue {
                        if countries.contains(countryName) {  }
                        else { countries.append(countryName) }
                    }else {
                        countries = countries.filter{$0 != countryName}
                    }
                }
                .onAppear(){
                    if countries.contains(countryName) {
                        toggleIsOn = true
                    }
                }
            Text(countryName)
        }
    }
    
    func isOn() -> Bool {
        if countries.contains(countryName) {
            return true
        }
        
        return false
    }
}
