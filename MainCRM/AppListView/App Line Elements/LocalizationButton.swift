//
//  LocalizationButton.swift
//  MainCRM
//
//  Created by Main on 16.03.2025.
//

import SwiftUI

struct LocalizationButton: View {
    @State private var showingPopover = false
    var app: AppModel
    
    var body: some View {
        Button {
            showingPopover.toggle()
        } label: {
            Image(systemName: "slider.horizontal.2.rectangle.and.arrow.triangle.2.circlepath")
                .resizable()
                .frame(width: 20)
        }
        .buttonStyle(.plain)
        .popover(isPresented: $showingPopover) {
            if let arr = app.localizations {
                LocalizationPopoverView(localizationsArray: arr)
            }
        }
    }
}

struct LocalizationPopoverView: View {
    @Environment(\.dismiss) var dismiss
    var localizationsArray: [String]

    var body: some View {
        VStack{
            ForEach(localizationsArray.indices) { index in
                HStack{
                    Text(localizationsArray[index])
                    Spacer()
                }
                Divider()
            }
        }
        .padding()
    }
}
