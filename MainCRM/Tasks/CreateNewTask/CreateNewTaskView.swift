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
    case creo
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
                    taskType = .creo
                } label: {
                    Text("Добавление креативов")
                }
                .background(getButtonColor(taskType: .creo))
            }
            .padding()
            
            switch taskType {
            case .release:
                TaskFirstModeration(app: app)
            case .rename:
                TaskRename()
            case .creo:
                TaskCreo()
            }
            
            Spacer()
        }
    }
    
    private func getButtonColor(taskType: TaskType) -> Color {
        return self.taskType == taskType ? Color.blue : Color.sectionBG
    }
}
