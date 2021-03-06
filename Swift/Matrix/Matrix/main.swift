//
//  main.swift
//  Matrix
//
//  Created by Artem Goldenberg on 28.12.2020.
//

import Foundation


enum MatrixError: Error {
    case differentTypes
    case IncorrectInput
}

let array: [[Double]] = [ [2,3,11,5], [1,1,5,2], [2,1,3,2], [1,1,3,4] ]
let array2: [[Double]] = [ [2], [1], [-3], [-3]]

let A = try! Matrix(rows: 4, cols: 4, numbers: array)
let E = try  Matrix(rows: 4, cols: 4)

let C = try A + E

func evklidAlgorithm(a: Int, b: Int) -> Int {
    var a = a
    var b = b
    
    while(a % b != 0) {
        let tmp = a
        a = b
        b = tmp % b
    }
    
    return b
}

func qudrimulti(A: Int, B: Int, M: Int) -> Int {
    
    var a = A % M
    var b = B
    var bs = [Bool]()
    
    while(b != 0) {
        bs.append(b % 2 == 1)
        
        b /= 2
    }
    
    let t = bs.count
    
    for i in 2...t {
        a = a * a * (bs[t - i] ? A : 1) % M
    }
    
    return a
}

print(qudrimulti(A: 2, B: 32, M: 641))


