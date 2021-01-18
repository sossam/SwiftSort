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

func selectionSort(_ array: inout [Int]) {
    for stand in 0..<(array.count - 1) {
        var minIndex = stand
        for index in (stand + 1)..<array.count {
            if array[index] < array[minIndex] {
                minIndex = index
            }
        }
        array.swapAt(stand, minIndex)
    }
}

func insertionSort(_ array: inout [Int]) {
    for stand in 1..<array.count {
        for index in stride(from: stand, to: 0, by: -1) {
            if array[index] < array[index - 1] {
                array.swapAt(index, index - 1)
            } else {
                break
            }
        }
    }
}

func quickSort(_ array: [Int]) -> [Int] {
    if array.count <= 1 {
        return array
    }
    
    let pivot = array[0]
    var left: [Int] = []
    var right: [Int] = []
    
    for index in 1..<array.count {
        if pivot > array[index]  {
            left.append(array[index])
        } else {
            right.append(array[index])
        }
    }
    
    return Array(quickSort(left) + [pivot] + quickSort(right))
}

func mergeSort(_ array: [Int]) -> [Int] {
    if array.count <= 1 { return array }
    let center = array.count / 2
    let left = Array(array[0..<center])
    let right = Array(array[center..<array.count])
    
    func merge(_ left: [Int],_ right: [Int]) -> [Int] {
        var left = left
        var right = right
        var result: [Int] = []
        
        while !left.isEmpty && !right.isEmpty {
            if left[0] < right[0] {
                result.append(left.removeFirst())
            } else {
                result.append(right.removeFirst())
            }
        }
        
        // 왼쪽 배열의 요소가 남은 경우
        if !left.isEmpty {
            result.append(contentsOf: left)
        }
        
        // 오른쪽 배열의 요소가 남은 경우
        if !right.isEmpty {
            result.append(contentsOf: right)
        }
        
        return result
    }
    
    return merge(mergeSort(left), mergeSort(right))
}
