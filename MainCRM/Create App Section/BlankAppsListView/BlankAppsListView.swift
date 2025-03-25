//
//  NewAppsListView.swift
//  MainCRM
//
//  Created by Main on 16.03.2025.
//

import SwiftUI
import FirebaseFirestore

struct BlankAppsListView: View {
    @EnvironmentObject private var blankAppsListVM: BlankAppsListViewModel
    @EnvironmentObject private var tasksListVM: TasksListViewModel
    @State private var isPresented = false
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack{
                    Button{
                        isPresented.toggle()
                    } label: {
                        MenuIconView(systemName: "plus.circle.fill")
                    }
                    .sheet(isPresented: $isPresented) {
                        AddNewBlankAppView(isPresented: $isPresented, blankAppsListVM: blankAppsListVM)
                    }
                    Spacer()
                    Button {
                        blankAppsListVM.getAppsList()
                        tasksListVM.getTasksWEBList()
                    } label: {
                        MenuIconView(systemName: "arrow.clockwise.circle.fill")
                    }
                    
                }
                
                
                
                if tasksListVM.tasksWEBList.contains(where: { !$0.isDone }) {
                    HStack{
                        Text("Финальное обновление")
                            .font(.title3)
                        Spacer()
                    }
                    List(tasksListVM.tasksWEBList){ app in
                        HStack{
                            LineItemView(text: app.appId, width: 150)
                            LineItemView(text: app.newAppName, width: 150)
                            LineItemView(text: app.createAccount, width: 150)
                            NavigationLink {
                                CreateFinalUpdate(app: app)
                            } label: {
                                Label {
                                    Text("Начать")
                                } icon: {
                                    Image(systemName: "arrow.right.square")
                                }

                            }

                        }
                    }
                }
                
                
                HStack{
                    Text("Cоздание приложений")
                        .font(.title3)
                    Spacer()
                }
                
                List(blankAppsListVM.appsList){ app in
                    HStack{
                        LineItemView(text: app.name, width: 150)
                        LineItemView(text: app.devLink, width: 150)
                        LineItemView(text: app.driveLink, width: 150)
                        NavigationLink {
                            CreateNewAppView(delegate: self, app: app)
                        } label: {
                            Label {
                                Text("Начать")
                            } icon: {
                                Image(systemName: "arrow.right.square")
                            }

                        }

                    }
                }
                Spacer()
            }
            .padding()
        }
    }
    
    func updateList(){
        blankAppsListVM.getAppsList()
    }
}

