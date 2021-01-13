//
//  main.swift
//  SwiftSorted
//
//  Created by 김소은 on 2021/01/13.
//

import Foundation

func bubbleSort(_ array: inout [Int]) {
    for index1 in 0..<(array.count - 1) {
        var isSwap = false
        for index2 in 0..<(array.count - 1 - index1) {
            if array[index2] > array[index2 + 1] {
                array.swapAt(index2, (index2 + 1))
                isSwap = true
            }
        }
        if isSwap == false { return }
    }
}
