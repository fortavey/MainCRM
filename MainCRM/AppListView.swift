//
//  AppListView.swift
//  MainCRM
//
//  Created by Main on 08.03.2025.
//

import SwiftUI

struct AppListView: View {
    @State private var isPresentation = false
    
    var body: some View {
        VStack {
            
            Text("AppListView!")
            Button("ALERT") {
                isPresentation = true
            }
            .alert("Some Alert", isPresented: $isPresentation, actions: {}) {
                Text("Some message")
            }
        }

    }
}

#Preview {
    AppListView()
}
