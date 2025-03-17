//
//  Section17DownloadFiles.swift
//  MainCRM
//
//  Created by Main on 16.03.2025.
//

import SwiftUI

struct Section17DownloadFiles: View {
    var appName: String
    @Binding var sections: [Int]
    @Binding var driveLink: String
    var index: Int
    
    var body: some View {
        VStack(alignment: .leading) {
                HStack{
                    Spacer()
                    Image(systemName: "17.square")
                }
            Text("Загрузка готовых файлов")
                .font(.title)
            Text("Откройте Google Диск и загрузите архив с файлами:")
            Text(" - app-release.aab")
            Text(" - \(appName.lowercased()).keystore")
            Text(" - скриншоты")
            Text(" - иконка 512х512")
            
            if let link = URL(string: "https://drive.google.com/drive/folders/1O38VJSDx0fM1y3yv5G_TznKnhTI8pQlO?usp=drive_link") {
                Link(destination: link) {
                    HStack{
                        Text("Загрузить")
                        Image("GoogleDriveIcon")
                            .resizable()
                            .frame(width: 17, height: 17)
                    }
                }
            }
            
            Text("Вставьте ссылку на загруженный архив")
                .font(.title2)
            
            TextField("Ссылка на архив", text: $driveLink)
                .background(Color.black)
                .textFieldStyle(.squareBorder)
            
            DefaultButtonView(title: "Готово") {
                sections.append(index+1)
            }
        }
        .sectionModifiers()
    }
}
