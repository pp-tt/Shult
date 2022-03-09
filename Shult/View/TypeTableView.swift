//
//  TypeTableView.swift
//  Shult
//
//  Created by xu on 2022/3/2.
//  宫格类型选择，如 4*4， 5*5

import SwiftUI

let width = UIScreen.main.bounds.width



struct TypeTableView: View {
    @Binding var size: Int   // 每行显示数目，数据流向 TableView
    @Binding var numberArray: [Int] // 生成宫格，数据流向 TableView
    
    @State var state = -1
    
    var body: some View {
        
        
        
        VStack {
            
            Text("选择挑战等级")
                .font(.title)
                .padding()
                .overlay{
                    Divider()
                        .offset(x: 0, y: 35)
                }
            
            
            
            
//                .foregroundColor(.white)
            
//            HStack{
//                TypeButton(id: 3, state: $state)
//                TypeButton(id: 4, state: $state)
//            }
//
//            HStack{
//                TypeButton(id: 5, state: $state)
//                TypeButton(id: 6, state: $state)
//            }
//
//            HStack{
//                TypeButton(id: 7, state: $state)
//                TypeButton(id: 8, state: $state)
//            }
            
            
            HStack{
                TypeButton(id: 3, state: $state, size: $size, numberArray: $numberArray)
                TypeButton(id: 4, state: $state, size: $size, numberArray: $numberArray)
            }

            HStack{
                TypeButton(id: 5, state: $state, size: $size, numberArray: $numberArray)
                TypeButton(id: 6, state: $state, size: $size, numberArray: $numberArray)
            }

            HStack{
                TypeButton(id: 7, state: $state, size: $size, numberArray: $numberArray)
                TypeButton(id: 8, state: $state, size: $size, numberArray: $numberArray)
            }
        }
        .overlay{
            RoundedRectangle(cornerRadius: 9)
                .stroke(lineWidth: 3)
        }
        
        
        
        
        
//        Text("Hello")
        
//        TabView {
//            ForEach(3...8, id: \.self) { number in
//
//                Button(action: {
//                    self.size = number
//                    self.numberArray = generateArray(n: number)
//                }) {
//                    RoundedRectangle(cornerRadius: 5)
//                        .stroke(lineWidth: 5)
//                        .frame(width: width-50, height: 180)
//                        .overlay{
//                            Text("\(number)✖️\(number)")
//                                .font(.system(size: 90))
//                        }
//                }
//                .foregroundColor(.black)
//
//
//
//            }
//        }
//        .frame(height: 200)
//        .tabViewStyle(PageTabViewStyle())
    }
}

struct TypeButton: View {
    var id: Int         // 判断变色并传递 size
    @Binding var state: Int  // 变色传递
    @Binding var size: Int   // 每行显示数目，数据流向 TableView
    @Binding var numberArray: [Int] // 生成宫格，数据流向 TableView
    
    var body: some View {
        Button(
            action: {
                self.state = self.id
                self.size = self.id
                self.numberArray = generateArray(n: self.id)
            }
        ) {
            Capsule()
                .stroke(lineWidth: 3)
                .frame(width: 120, height: 40)
                .overlay{
                    Text("\(self.id) × \(self.id)")
                }
            
        }
        .foregroundColor(self.id == self.state ? .black : .gray)
        .padding()
    }
}



//struct TypeTableView_Previews: PreviewProvider {
//
//    static var previews: some View {
////        TypeTableView(size: $size, numberArray: $numberArray)
//        TypeTableView()
//    }
//}
