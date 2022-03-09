//
//  DetectNumber.swift
//  Shult
//
//  Created by xu on 2022/3/1.
//

import Foundation
import SwiftUI


var numberArray: [Int] = generateArray(n:5)


func generateArray(n: Int) -> [Int] {
    var numberArray = Array(repeating: 0, count: n*n)
    for index in 1...n*n {
        numberArray[index-1] = index
    }
    return numberArray.shuffled()
}
