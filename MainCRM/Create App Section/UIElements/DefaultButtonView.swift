//
//  DefaultButtonView.swift
//  MainCRM
//
//  Created by Main on 08.03.2025.
//

import SwiftUI

struct DefaultButtonView: View {
    var title: String
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            Text(title)
        }
    }
}

#Preview {
    DefaultButtonView(title: "Start", action: {})
}
