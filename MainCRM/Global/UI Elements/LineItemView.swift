//
//  LineItemView.swift
//  MainCRM
//
//  Created by Main on 13.03.2025.
//

import SwiftUI

struct LineItemView: View {
    var text: String
    var width: CGFloat
    var color: Color?
    var icon: String?
    
    var body: some View {
        HStack{
            if let icon = icon {
                Image(icon)
                    .resizable()
                    .frame(width: 12, height: 12)
            }
            Text(text)
                .foregroundStyle(Color.white)
                .lineLimit(1)
            Spacer()
        }
        .frame(width: width, height: 20)
        .padding(.horizontal, 5)
        .background((color != nil) ? color : Color.sectionBG)
    }
}
