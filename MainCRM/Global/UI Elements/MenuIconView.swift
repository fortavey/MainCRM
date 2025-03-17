//
//  MenuIconView.swift
//  MainCRM
//
//  Created by Main on 12.03.2025.
//

import SwiftUI

struct MenuIconView: View {
    var systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .resizable()
            .frame(width: 25, height: 25)
            .padding(2)
    }
}
