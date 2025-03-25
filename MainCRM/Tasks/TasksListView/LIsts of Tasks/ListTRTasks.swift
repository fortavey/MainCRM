//
//  ListTRTasks.swift
//  MainCRM
//
//  Created by Main on 25.03.2025.
//

import SwiftUI

struct ListTRTasks: View {
    @EnvironmentObject private var tasksListVM: TasksListViewModel
    @Binding var isRemoveMode: Bool
    
    var body: some View {
        VStack{
            HStack{
                Text("Список задач на трансфер приложений").font(.title3)
                Spacer()
            }
            List(tasksListVM.tasksTRList){ task in
                HStack{
                    if isRemoveMode {
                        RemoveButtonView(
                                title: "Задача трансфера",
                                id: task.id,
                                collection: TaskDB.tr.rawValue
                        ) {
                            tasksListVM.getTasksTRList()
                        }
                    }
                    LineItemView(text: task.appId, width: 250)
                    LineItemView(text: task.createAccountName, width: 100)
                    LineItemView(text: "->", width: 50)
                    LineItemView(text: task.transferAccountName, width: 100)
                    
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
