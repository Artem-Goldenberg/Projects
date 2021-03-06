//
//  main.swift
//  Swift test
//
//  Created by Artem Goldenberg on 14.10.2020.
//  Copyright © 2020 Artem Goldenberg. All rights reserved.
//

import Foundation

class Determinator {
    let numbers: [[Double]]
    init(numbers: [[Double]]){ self.numbers = numbers }
    func count() -> Double {
        var sign: Int
        var res: Double = 0
        let n = numbers.count
        if (n == 1) { return numbers[0][0] }
        for i in 0..<n {
            if i % 2 == 0 { sign = 1 }
            else { sign = -1}
            var newDet = Array(repeating: Array(repeating: 0.0, count: n-1), count: n-1)
            var index1 = 0, index2 = 0
            for j in 0..<n {
                if i == j { continue }
                for k in 1..<n {
                    newDet[index1][index2] = numbers[j][k]
                    index2 += 1
                }
                index1 += 1
                index2 = 0
            }
            let new = Determinator(numbers: newDet)
            res += Double(sign)*new.count()*numbers[i][0]
        }
        return res
    }
}

let arr = [[9, -12, -4],[-12,16,9.5],[-4,9.5,4]]
//let arr = [[5, -12, -4],[-2.5,16,9.5],[0,9.5,4]]
//let arr = [[16.0,9.5],[9.5,4.0]]
let det = Determinator(numbers: arr)
print(det.count())

