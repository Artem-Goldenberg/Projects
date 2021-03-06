//
//  File.swift
//  Matrix
//
//  Created by Artem Goldenberg on 31.12.2020.
//

import Foundation

func solveSystem(A: Matrix, B: Matrix) throws -> [Double]? {
    guard A.rows == A.cols && B.cols == 1 && B.rows == A.rows else {
        throw MatrixError.IncorrectInput
    }
    
    var answers = [Double]()
    
    let determinatorA = try det(A)
    
    if determinatorA != 0 {
        for k in 0..<A.cols {
            var tmp = A
            
            for i in 0..<A.rows {
                tmp.numbers[i][k] = B.numbers[i][0]
            }
            
            let determinator = try det(tmp)
            let answer = determinator / determinatorA
            answers.append(answer)
        }
    } else {
        var sum = 0.0
        
        for k in 0..<A.cols {
            var tmp = A
            for i in 0..<A.rows {
                tmp.numbers[i][k] = B.numbers[i][0]
            }
            sum += (try det(tmp))*(try det(tmp))
        }
        
        if sum == 0 {
            if determinatorA == 0 {
                print("infinite solutions")
                return nil
            }
        }
    }
    
    
    return answers
}
