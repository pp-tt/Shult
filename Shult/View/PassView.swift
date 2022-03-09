//
//  PassView.swift
//  Shult
//
//  Created by xu on 2022/3/3.
//

import SwiftUI

struct PassView: View {
    
    @Binding var size: Int   // 保持不变
    @Binding var numberArray: [Int] // 生成同 size 大小的表格
    @Binding var nextNumber: Int    // 继续则下一个数字为 1
    @Binding var time: Int          // 时间重头开始计时
    @Binding var isPass: Bool       // 记录是否弹窗
    @Binding var isStart: Bool      // 返回
    
    var passTime: Int {
        get {
            self.time
        }
    }
    
    var body: some View {
        
        
        
        VStack{
            HStack{
                Text("\(self.passTime)")
                    .font(.largeTitle)
                Text("s")
                    .font(.title2)
                    .offset(x: -5, y: 3)
            }
            .padding()
            
            
            HStack{
                Button(
                    action: {
                        self.isPass = false
                        self.numberArray = generateArray(n: self.size)
                        self.nextNumber = 1
                        self.time = 0
                    }
                ) {
                    Capsule()
                        .stroke(lineWidth: 3)
                        .frame(width: 120, height: 40)
                        .overlay{
                            Text("继续")
                                .font(.title)
                        }
                }
                .foregroundColor(.black)
                
                
                
                Button(
                    action: {
                        self.isStart = true
                        self.isPass = false
//                        self.numberArray = generateArray(n: self.size)
//                        self.time = 0
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
                .padding()
            }
            .padding()
        }
        .padding()
        .overlay{
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 3)
                .padding()
        }
        
    }
}

//struct PassView_Previews: PreviewProvider {
//    static var previews: some View {
//        PassView()
//    }
//}
