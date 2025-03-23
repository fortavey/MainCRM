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
                        tasksListVM.getTasksRNList()
                        tasksListVM.getTasksCRList()
                    } label: {
                        MenuIconView(systemName: "arrow.clockwise.circle.fill")
                    }
                }
                
                if tasksListVM.tasksFMList.count > 0 { ListFMTasks(isRemoveMode: $isRemoveMode) }
                
                if tasksListVM.tasksRNList.count > 0 { ListRNTasks(isRemoveMode: $isRemoveMode) }
                
                if tasksListVM.tasksCRList.count > 0 { ListCRTasks(isRemoveMode: $isRemoveMode) }
                
            }
            .padding()
        }
    }
}
