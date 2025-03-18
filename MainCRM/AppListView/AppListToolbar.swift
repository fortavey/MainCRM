//
//  AppListToolbar.swift
//  MainCRM
//
//  Created by Main on 17.03.2025.
//

import SwiftUI

struct AppListToolbar: View {
    @EnvironmentObject private var appListVM: AppListViewModel
    @Binding var isRemoveMode: Bool
    @Binding var isLinkMode: Bool
    @Binding var isCompMode: Bool
    @Binding var isCreoMode: Bool
    @Binding var isPresented: Bool
    @Binding var isBanMode: Bool
    @Binding var isSelfMode: Bool
    
    var body: some View {
        HStack{
            // Кнопка добавить
            Button{
                isPresented.toggle()
            } label: {
                MenuIconView(systemName: "plus.circle.fill")
            }
            .sheet(isPresented: $isPresented) {
                AddNewApp(isPresented: $isPresented, appListVM: appListVM)
            }
            // Кнопка компьютеры
            Button {
                isCompMode.toggle()
            } label: {
                MenuIconView(systemName: "macpro.gen3")
                    .foregroundStyle(isCompMode ? Color.red : Color.white)
            }
            // Кнопка ссылки
            Button {
                isLinkMode.toggle()
            } label: {
                MenuIconView(systemName: "link.circle.fill")
                    .foregroundStyle(isLinkMode ? Color.red : Color.white)
            }
            // Кнопка креативы
            Button {
                isCreoMode.toggle()
            } label: {
                MenuIconView(systemName: "photo.on.rectangle.angled")
                    .foregroundStyle(isCreoMode ? Color.red : Color.white)
            }
            // Кнопка БАН
            Button {
                isBanMode.toggle()
            } label: {
                MenuIconView(systemName: "circle.slash")
                    .foregroundStyle(isBanMode ? Color.red : Color.white)
            }
            // Кнопка Самофарм
            Button {
                isSelfMode.toggle()
            } label: {
                MenuIconView(systemName: "tray.and.arrow.down.fill")
                    .foregroundStyle(isSelfMode ? Color.red : Color.white)
            }
            // Кнопка удаление
            Button {
                isRemoveMode.toggle()
            } label: {
                MenuIconView(systemName: "trash.circle.fill")
                    .foregroundStyle(isRemoveMode ? Color.red : Color.white)
            }
            Spacer()
            Button {
                appListVM.getAppsList()
            } label: {
                MenuIconView(systemName: "arrow.clockwise.circle.fill")
            }
        }
    }
}
