//
//  TaskTimerView.swift
//  MainCRM
//
//  Created by Main on 09.06.2025.
//

import SwiftUI

struct OneTimerView: View {
    @State private var seconds: String = ""
    var timer: TimerModel
    let timerV = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        HStack{
            Text(timer.id)
            Text(seconds)
                .onReceive(timerV) { _ in
                    lastSeconds()
                }
        }
    }
    
    private func lastSeconds() {
        let now = Int(Date().timeIntervalSince1970)
        let diference = Int(timer.endTime) - now
        seconds = "\(diference)"
        if diference < 0 {
            
        }
    }
}

struct TaskTimerView: View {
    @EnvironmentObject private var taskTimerVM: TaskTimerViewModel
    var body: some View {
        VStack{
            Text("Hello, Task timer!")
            List(taskTimerVM.timersList, id: \.id){timer in
                OneTimerView(timer: timer)
            }
        }
    }
}
