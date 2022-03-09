//
//  TableView.swift
//  Shult
//
//  Created by xu on 2022/2/28.
//

import SwiftUI

struct TableView: View {
//    @State var size = 5
//    @State var numberArray: [Int]
    
    @Binding var size: Int
    @Binding var numberArray: [Int]
    @Binding var nextNumber: Int
    
    @Binding var time: Int          // 时间重头开始计时
    @Binding var isStart: Bool      // 返回
    @Binding var isPass: Bool
    
        
    
    var body: some View {
        VStack {
            ForEach(1...size, id:\.self) {i in
                HStack{
                    ForEach(1...size, id:\.self) {j in
//                        GridView(id:(i-1)*size+j-1, grid_row_num: size, number: numberArray[(i-1)*size+j-1], nextNumber: $nextNumber)
                        GridView(id:(i-1)*size+j-1, grid_row_num: size, number: numberArray[(i-1)*size+j-1], nextNumber: $nextNumber, isPass: $isPass, size: $size, time: $time, isStart: $isStart, numberArray: $numberArray)
                    }
                }
            }
        }
    }
    
    func getRowCount(numberArray: [Int]) -> Int{
        return numberArray.count
    }
}

//struct TableView_Previews: PreviewProvider {
//    static var previews: some View {
//        TableView()
//    }
//}




