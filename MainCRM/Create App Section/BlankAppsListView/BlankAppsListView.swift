//
//  NewAppsListView.swift
//  MainCRM
//
//  Created by Main on 16.03.2025.
//

import SwiftUI
import FirebaseFirestore

struct PickerCompView: View {
    @State private var devComp: String
    var app: TaskWebViewModel
    
    init(app: TaskWebViewModel) {
        self.devComp = app.devComp
        self.app = app
    }
    
    var body: some View {
        Picker("", selection: $devComp) {
            Text("ANNA").tag("ANNA")
            Text("KRIS").tag("KRIS")
        }
        .frame(width: 100)
        .onChange(of: devComp, initial: true) { oldValue, newValue in
            if oldValue != newValue {
                FirebaseServices().updateDocument(id: app.id,
                                                  collection: TaskDB.web.rawValue,
                                                  fields: ["devComp" : devComp]) { result in
                    if result {
                        print("Change COMP - \(newValue)")
                    }else {
                        print("Ошибка обновления трастового аккаунта")
                    }
                }
            }
            
        }
        .onTapGesture {
            print("CLICK")
        }
    }
}

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
                
                
                
                if MainConfig.isAdmin {
                    if tasksListVM.tasksWEBList.contains(where: { !$0.isDone }) {
                        HStack{
                            Text("Финальное обновление")
                                .font(.title3)
                            Spacer()
                        }
                        List(tasksListVM.tasksWEBList){ app in
                            HStack{
                                PickerCompView(app: app)
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

