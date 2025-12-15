//
//  CreateNewTaskView.swift
//  MainCRM
//
//  Created by Main on 18.03.2025.
//

import SwiftUI

enum TaskType {
    case release
    case rename
    case turnon
    case webview
    case local
    case transfer
}

struct CreateNewTaskView: View {
    @State private var taskType: TaskType = .release
    var app: AppModel
    
    var body: some View {
        VStack{
            HStack{
                Button {
                    taskType = .release
                } label: {
                    Text("Первая модерация")
                }
                .background(getButtonColor(taskType: .release))
                
                Button {
                    taskType = .rename
                } label: {
                    Text("Переименование")
                }
                .background(getButtonColor(taskType: .rename))
                
                Button {
                    taskType = .turnon
                } label: {
                    Text("Включение приложения")
                }
                .background(getButtonColor(taskType: .turnon))
                
                Button {
                    taskType = .local
                } label: {
                    Text("Локальное обновление")
                }
                .background(getButtonColor(taskType: .local))
                
                Button {
                    taskType = .webview
                } label: {
                    Text("Webview")
                }
                .background(getButtonColor(taskType: .webview))
                Button {
                    taskType = .transfer
                } label: {
                    Text("Трансфер приложения")
                }
                .background(getButtonColor(taskType: .transfer))
            }
            .padding()
            
            switch taskType {
            case .release:
                TaskFirstModeration(app: app)
            case .rename:
                TaskRename(app: app)
            case .turnon:
                TaskTurnOn(app: app)
            case .local:
                LocalUpdate(app: app)
            case .transfer:
                TaskTransfer(app: app)
            case .webview:
                TaskWebview(app: app)
            }
            
            Spacer()
        }
        .onAppear(){
            if app.moderationStatus != "" {
                taskType = .rename
            }
        }
    }
    
    private func getButtonColor(taskType: TaskType) -> Color {
        return self.taskType == taskType ? Color.blue : Color.sectionBG
    }
}
