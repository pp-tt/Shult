//
//  NextNumberView.swift
//  Shult
//
//  Created by xu on 2022/3/2.
//

import SwiftUI

struct NextNumberView: View {
    @Binding var nextNumber: Int
    
    var body: some View {
        HStack{
            Text("下个数")
            Text("\(nextNumber)")
        }
        .font(.title2)
        
    }
}

//struct NextNumberView_Previews: PreviewProvider {
//    static var previews: some View {
//        NextNumberView()
//    }
//}
