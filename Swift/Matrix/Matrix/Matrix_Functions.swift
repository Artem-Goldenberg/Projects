//
//  Matrix_Functions.swift
//  Matrix
//
//  Created by Artem Goldenberg on 28.12.2020.
//

import Foundation
import SwiftUI


func print(_ A: Matrix) {
    for i in 0..<A.rows {
        for j in 0..<A.cols {
            let str = String(format: "%g", A.numbers[i][j])
            print(str, terminator: " ")
        }
        print()
    }
    print()
}


func *(A: Matrix, B: Matrix) throws -> Matrix {
    if A.cols != B.rows { print("Error"); throw MatrixError.differentTypes }
    
    var array = Array(repeating: Array(repeating: 0.0, count: B.cols), count: A.rows)
    
    for i in 0..<A.rows {
        for j in 0..<B.cols {
            var sum = 0.0
            for k in 0..<A.cols {
                sum += A.numbers[i][k] * B.numbers[k][j]
            }
            array[i][j] = sum
        }
    }
    
    return try! Matrix(rows: A.rows, cols: B.cols, numbers: array)
}


func +(A: Matrix, B: Matrix) throws -> Matrix {
    if A.cols != B.cols || A.rows != B.rows { print("Error"); throw MatrixError.differentTypes }
    
    var array = Array(repeating: Array(repeating: 0.0, count: A.cols), count: A.rows)

    for i in 0..<A.rows {
        for j in 0..<A.cols {
           array[i][j] = A.numbers[i][j] + B.numbers[i][j]
        }
    }

    return try! Matrix(rows: A.rows, cols: A.cols, numbers: array)
}


func |(A: Matrix, B: Matrix) throws -> Matrix {
    if A.rows != B.rows { print("Error"); throw MatrixError.differentTypes }

    var array = Array(repeating: Array(repeating: 0.0, count: A.cols + B.cols), count: A.rows)

    for i in 0..<A.rows {
        array[i] = A.numbers[i] + B.numbers[i]
    }

    return try! Matrix(rows: A.rows, cols: A.cols + B.cols, numbers: array)
}

func det(_ A: Matrix) throws -> Double {
    try A.square()
    
    let determinator = Determinator(numbers: A.numbers)
    
    return determinator.count()
}
