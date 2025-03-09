//
//  CreateNewAppView.swift
//  MainCRM
//
//  Created by Main on 08.03.2025.
//

import SwiftUI

struct CreateNewAppView: View {
    @State private var appName = ""
    @State private var sections: [Int] = []
    
    var body: some View {
        VStack {
            Text("Введите название нового приложения")
            HStack {
                TextField("Название приложения", text: $appName)
                    .frame(width: 800)
                DefaultButtonView(title: "Пуск") {
                    sections.append(1)
                }
                .disabled(appName != "" ? false : true)

            }
            List {
                if sections.contains(1) {Section01CreateAppView(appName: appName, sections: $sections, index: 1)}
                if sections.contains(2) {Section02FirstStart(appName: appName, sections: $sections, index: 2)}
                if sections.contains(3) {Section03TerminalError(appName: appName, sections: $sections, index: 3)}
                if sections.contains(4) {Section04StartInAndroidStudio(appName: appName, sections: $sections, index: 4)}
                if sections.contains(5) {SectionStopProcess(appName: appName, sections: $sections, index: 5)}
                if sections.contains(6) {Section06InstallDeps(appName: appName, sections: $sections, index: 6)}
                if sections.contains(7) {Section07NavigationSettings(appName: appName, sections: $sections, index: 7)}
                if sections.contains(8) {Section08CreateKeytool(appName: appName, sections: $sections, index: 8)}
                if sections.contains(9) {Section09CopyFiles(appName: appName, sections: $sections, index: 9)}
                if sections.contains(10) {SectionStartProcess(appName: appName, sections: $sections, index: 10)}
                if sections.contains(11) {SectionStopProcess(appName: appName, sections: $sections, index: 11)}
                if sections.contains(12) {Section12AddIcon(appName: appName, sections: $sections, index: 12)}
                if sections.contains(13) {SectionStartProcess(appName: appName, sections: $sections, index: 13)}
                if sections.contains(14) {Section14MakeScreens(appName: appName, sections: $sections, index: 14)}
                if sections.contains(15) {Section15EndSettings(appName: appName, sections: $sections, index: 15)}
                if sections.contains(16) {Section16Build(appName: appName, sections: $sections, index: 16)}
            }
            Spacer()
            
            HStack{
                Spacer()
                Button("Сброс") {
                    appName = ""
                    sections = []
                }
            }
            
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
        
    }
}

#Preview {
    CreateNewAppView()
}
