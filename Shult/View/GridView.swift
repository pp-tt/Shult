//
//  GridView.swift
//  Shult
//
//  Created by xu on 2022/2/28.
//

import SwiftUI


// UIScreen.main.bounds.width: get screen width
// UIScreen.main.bounds.heigth: get screen heigth

struct GridView: View {
    let id: Int // 检测数据是否对应
    let grid_row_num: Int
    let number: Int
    @Binding var nextNumber: Int
    @Binding var isPass: Bool
    @Binding var size: Int
    @Binding var time: Int
    @Binding var isStart: Bool
    @Binding var numberArray: [Int]
    
    var body: some View {
        Button(
            action: {
                if self.number == self.nextNumber {
                    if self.number == (self.grid_row_num * self.grid_row_num) {
                        self.isPass = true
                    } else {
                        self.nextNumber += 1
                    }
                }
            }
        ) {
            RoundedRectangle(cornerRadius: 9)
                .stroke(lineWidth: 3)
                .foregroundColor(.black)
                .frame(width: UIScreen.main.bounds.width / CGFloat(self.grid_row_num + 3), height: UIScreen.main.bounds.width / CGFloat(self.grid_row_num + 3))
                .overlay{
                    Text("\(self.number)")
                        .font(.title3)
                        .foregroundColor(.black)
                }
        }
        .sheet(isPresented: $isPass, content: {
            PassView(size: $size, numberArray: $numberArray, nextNumber: $nextNumber, time: $time, isPass: $isPass, isStart: $isStart)
                .highPriorityGesture(DragGesture())
        })
            
    }
}


//struct 


//struct GridView_Previews: PreviewProvider {
//    static var previews: some View {
//        GridView(id: 1, grid_row_num: 10, number: 8)
//    }
//}
