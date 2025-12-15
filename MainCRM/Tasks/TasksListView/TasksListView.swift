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
                        tasksListVM.updateAll()
                    } label: {
                        MenuIconView(systemName: "arrow.clockwise.circle.fill")
                    }
                }
                
                if tasksListVM.tasksFMList.count > 0 { ListFMTasks(isRemoveMode: $isRemoveMode) }
                
                if tasksListVM.tasksRNList.count > 0 { ListRNTasks(isRemoveMode: $isRemoveMode) }
                
                if tasksListVM.tasksTOList.count > 0 { ListCRTasks(isRemoveMode: $isRemoveMode) }
                
                if tasksListVM.tasksLOList.count > 0 { ListASOTasks(isRemoveMode: $isRemoveMode) }
                
                if tasksListVM.tasksTRList.count > 0 { ListTRTasks(isRemoveMode: $isRemoveMode) }
                
            }
            .padding()
        }
    }
}
