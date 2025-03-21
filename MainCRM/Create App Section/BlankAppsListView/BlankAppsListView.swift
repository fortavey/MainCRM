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
                    } label: {
                        MenuIconView(systemName: "arrow.clockwise.circle.fill")
                    }
                    
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

