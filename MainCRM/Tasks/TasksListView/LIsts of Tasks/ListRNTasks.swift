//
//  ListRNTasks.swift
//  MainCRM
//
//  Created by Main on 22.03.2025.
//

import SwiftUI

struct ListRNTasks: View {
    @EnvironmentObject private var tasksListVM: TasksListViewModel
    @Binding var isRemoveMode: Bool
    
    var body: some View {
        VStack {
            HStack{
                Text("Список задач на переименование").font(.title3)
                Spacer()
            }
            List(tasksListVM.tasksRNList){ task in
                HStack{
                    if isRemoveMode {
                        RemoveButtonView(
                                title: "Задача переименование - \(Helpers().getAppStoreId(appName: task.firstAppName))",
                                id: task.id,
                                collection: TaskDB.rn.rawValue
                        ) {
                            tasksListVM.getTasksRNList()
                        }
                    }
                    LineItemView(text: task.firstAppName, width: 150)
                    LineItemView(text: task.newAppName, width: 150)
                    LineItemView(text: "com." + Helpers().getAppStoreId(appName: task.firstAppName), width: 150)
                    LineItemView(text: task.createAccount, width: 150)
                    LineItemView(text: task.updateType, width: 150)
                    LineItemView(text: task.moderationStatus, width: 100)
                    LineItemView(text: task.message, width: 200)
                    
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
