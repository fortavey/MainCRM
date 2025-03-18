//
//  TasksListView.swift
//  MainCRM
//
//  Created by Main on 18.03.2025.
//

import SwiftUI

struct TasksListView: View {
    @EnvironmentObject private var tasksListVM: TasksListViewModel
    @State private var isRemoveMode = false
    @State private var isPresented = false
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack{
                    Button {
                        isRemoveMode.toggle()
                    } label: {
                        MenuIconView(systemName: "trash.circle.fill")
                            .foregroundStyle(isRemoveMode ? Color.red : Color.white)
                    }
                    Spacer()
                    Button {
                        tasksListVM.getTasksFMList()
                    } label: {
                        MenuIconView(systemName: "arrow.clockwise.circle.fill")
                    }
                }
                
                List(tasksListVM.tasksFMList){ task in
                    HStack{
                        if isRemoveMode {
                            RemoveButtonView(title: "Задача первой модерации - \(task.firstAppName)",
                                             id: task.id,
                                             collection: "taskfirsmoderation") {
                                tasksListVM.getTasksFMList()
                            }
                        }
                        LineItemView(text: task.firstAppName, width: 150)
                        LineItemView(text: task.createAccount, width: 150)
                        LineItemView(text: task.updateType, width: 150)
                        LineItemView(text: task.moderationStatus, width: 100)
                    }
                }
            }
            .padding()
        }
    }
}
