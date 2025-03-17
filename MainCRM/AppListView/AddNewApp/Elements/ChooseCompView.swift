//
//  ChooseCompView.swift
//  MainCRM
//
//  Created by Main on 13.03.2025.
//

import SwiftUI

enum Comps: String {
    case mm1 = "MM1"
    case mm2 = "MM2"
}

struct ChooseCompView: View {
    @Binding var devComp: Comps
    
    var body: some View {
        Picker(selection: $devComp) {
            Text("MM1").tag(Comps.mm1)
            Text("MM2").tag(Comps.mm2)
        }label: {
            HStack{
                Text("Компьютер")
                Spacer()
            }
            .frame(width: 150)
        }
    }
}
