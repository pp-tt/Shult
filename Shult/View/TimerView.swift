//
//  TimerView.swift
//  Shult
//
//  Created by xu on 2022/3/2.
//

import SwiftUI

struct TimerView: View {
    @Binding var time: Int
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Binding var isPass: Bool

    var body: some View {
        VStack{
            HStack{
                Text("\(time)")
                    .font(.largeTitle)
                Text("s")
                    .font(.title2)
                    .offset(x: -5, y: 3)
            }
        }.onReceive(timer) { _ in
            if !isPass {
                self.time += 1
            }
//            if self.timeRemaining > 0 {
//                self.timeRemaining += 1
//            }
        }
    }
}
//
//struct ContentView: View {
//
//}

//struct TimerView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimerView()
//    }
//}
