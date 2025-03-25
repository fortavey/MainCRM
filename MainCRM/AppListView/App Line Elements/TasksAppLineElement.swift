//
//  TasksAppLineElement.swift
//  MainCRM
//
//  Created by Main on 22.03.2025.
//

import SwiftUI



struct TasksAppLineElement: View {
    @EnvironmentObject private var tasksListVM: TasksListViewModel
    var app: AppModel
    
    var body: some View {
        if tasksListVM.isTaskExists(id: app.id) {
            if let res = tasksListVM.isTaskDone(id: app.id) {
                if res {
                    HStack{
                        Image(systemName: "flag.pattern.checkered.2.crossed")
                            .foregroundStyle(Color.green)
                        
                        if let collection = tasksListVM.getTaskType(id: app.id) {
                            RemoveButtonView(title: "?",
                                             id: app.id,
                                             collection: collection) {
                                tasksListVM.updateAll()
                            }
                        }
                    }
                }else {
                    ProgressView()
                        .frame(width: 25, height: 25)
                        .scaleEffect(x: 0.5, y: 0.5, anchor: .center)
                }
            }
        }else {
            NavigationLink {
                CreateNewTaskView(app: app)
            } label: {
                ZStack{
                    HStack{
                        Text("Создать задание")
                        Image(systemName: "rectangle.center.inset.filled.badge.plus")
                    }
                }
                .frame(width: 150, height: 20)
                .background(Color.sectionBG)
            }
        }
    }
}
