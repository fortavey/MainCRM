//
//  AppUpdate404StatusView.swift
//  MainCRM
//
//  Created by Main on 12.04.2025.
//

import SwiftUI

struct AppUpdate404StatusView: View {
    @EnvironmentObject private var appUpdate404StatusVM: AppUpdate404StatusViewModel
    @State private var isPresented: Bool = true
    
    var body: some View {
        HStack{
            Button {
                appUpdate404StatusVM.changeRequestErrorStatus(status: false)
                appUpdate404StatusVM.reset()
                appUpdate404StatusVM.start()
            } label: {
                MenuIconView(systemName: "arrow.trianglehead.clockwise.icloud")
            }
            if appUpdate404StatusVM.requestError {
                
                Button(""){}
                    .alert("Ошибка запроса", isPresented: $isPresented) {
                        Button("OK") {
                            appUpdate404StatusVM.changeRequestErrorStatus(status: false)
                        }
                    } message: {
                        Text("Не удалось получить данные")
                    }
                    .onAppear() {
                        isPresented = true
                    }
            }

        }
    }
}
