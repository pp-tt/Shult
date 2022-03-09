//
//  ContentView.swift
//  Shult
//
//  Created by xu on 2022/2/28.
//

import SwiftUI

struct ContentView: View {
    @State var time = 0  // 计时器 对应 TimerView 视图
    @State var size = 5    // 每行显示数目，数据流向 GameView -> TableView
    @State var numberArray = generateArray(n: 5) // 生成宫格，数据流向 TableView
    
    @State var isStart = true
    @State var isPass = false
    
    var body: some View {
        
        GameView(time: $time, size: $size, numberArray: $numberArray, isPass: $isPass, isStart: $isStart)
            .sheet(isPresented: $isStart, content: {
                StartView(isStart: $isStart, time: $time, size: $size, numberArray: $numberArray)
                    .highPriorityGesture(DragGesture())
            }
            )
            
        

    }
}


struct StartView: View {
    
    @Binding var isStart: Bool
    @Binding var time: Int  // 计时器 对应 TimerView 视图
    @Binding var size: Int   // 每行显示数目，数据流向 TableView
    @Binding var numberArray: [Int] // 生成宫格，数据流向 TableView
    
    var body: some View {
        VStack{
            
            // 名称
            Spacer()
            Group {
                Text("极简舒尔特方格")
                    .font(.largeTitle)
                
            }
            
            Spacer()
            
            
            // 类型选择
//            TypeTableView()
            TypeTableView(size: $size, numberArray: $numberArray)
            Spacer()
            
            
            // 按钮区
            
            Group {
                
                // 准备开始
                
                Button(
                    action: {
                        self.isStart = false
//                        self.numberArray = generateArray(n: self.size)
                        self.time = 0
                    }
                ) {
                    Capsule()
                        .stroke(lineWidth: 3)
                        .frame(width: 120, height: 40)
                        .overlay{
                            Text("开始")
                                .font(.title)
                        }
                }
                .foregroundColor(.black)
                
                
                
                
                
//                Button(
//                    action: {
//                        print("test")
//                    }
//                ) {
//                    Capsule()
//                        .stroke(lineWidth: 3)
//                        .frame(width: 120, height: 40)
//                        .overlay{
//                            Text("战绩")
//                                .font(.title)
//                        }
//                }
//                .foregroundColor(.black)
            }
            .padding()
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

