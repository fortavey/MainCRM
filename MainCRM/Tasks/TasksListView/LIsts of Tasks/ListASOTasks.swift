//
//  ListASOTasks.swift
//  MainCRM
//
//  Created by Main on 23.03.2025.
//

import SwiftUI

struct ListASOTasks: View {
    @EnvironmentObject private var tasksListVM: TasksListViewModel
    @Binding var isRemoveMode: Bool
    
    var body: some View {
        VStack{
            HStack{
                Text("Список задач на добавление в ASOMobile").font(.title3)
                Spacer()
            }
            List(tasksListVM.tasksASOList){ task in
                HStack{
                    if isRemoveMode {
                        RemoveButtonView(
                                title: "Задача добавления в ASOMobile",
                                id: task.id,
                                collection: TaskDB.cr.rawValue
                        ) {
                            tasksListVM.getTasksASOList()
                        }
                    }
                    LineItemView(text: task.appLink, width: 450)
                    
                    if task.isDone {
                        Image(systemName: "flag.pattern.checkered.2.crossed")
                            .foregroundStyle(Color.green)
                    }else {
                        Image(systemName: "paperplane.fill")
                    }
                
                }
            }
        }
    }
}
