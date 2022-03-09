//
//  GameView.swift
//  Shult
//
//  Created by xu on 2022/3/3.
//

import SwiftUI

struct GameView: View {
    @Binding var time: Int  // 计时器 对应 TimerView 视图
    @Binding var size: Int   // 每行显示数目，数据流向 TableView
    @Binding var numberArray: [Int] // 生成宫格，数据流向 TableView
    @Binding var isPass: Bool

    @State var nextNumber = 1   // 下个数，数据流向 TableView -> GridView
    @Binding var isStart: Bool
    
    
    var body: some View {
//        Text("hello")
        VStack{
        
            NextNumberView(nextNumber: $nextNumber)     // 下一个数

            Spacer()
            TimerView(time: $time, isPass: $isPass)
            Spacer()
//            TableView(size: $size, numberArray: $numberArray, nextNumber: $nextNumber, )
            
            TableView(size: $size, numberArray: $numberArray, nextNumber: $nextNumber, time: $time, isStart: $isStart, isPass: $isPass)
            
            Spacer()
            Group{
                Button(
                    action: {
                        self.nextNumber = 1
                        self.numberArray = generateArray(n: self.size)
                        self.time = 0
                    }
                ) {
                    Capsule()
                        .stroke(lineWidth: 3)
                        .frame(width: 120, height: 40)
                        .overlay{
                            Text("重来")
                                .font(.title)
                        }
                }
                .foregroundColor(.black)
                
                
                Button(
                    action: {
                        self.nextNumber = 1
                        self.numberArray = generateArray(n: self.size)
                        self.time = 0
                        self.isStart = true
                    }
                ) {
                    Capsule()
                        .stroke(lineWidth: 3)
                        .frame(width: 120, height: 40)
                        .overlay{
                            Text("返回")
                                .font(.title)
                        }
                }
                .foregroundColor(.black)
            }
            
//            ButtonView(buttonName: "Again")
//            ButtonView(buttonName: "Return")
            Spacer()
        }

//        TableView(size: 5)
    }
}
//struct GameView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameView()
//    }
//}
