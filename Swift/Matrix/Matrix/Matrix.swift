//
//  Matrix.swift
//  Matrix
//
//  Created by Artem Goldenberg on 28.12.2020.
//

import Foundation

struct Matrix {
    var rows: Int
    var cols: Int
    var numbers: [[Double]]
    
    init(rows: Int = 0, cols: Int = 0, numbers: [[Double]] = [[Double]]()) throws {
        self.rows = rows
        self.cols = cols
        
        if numbers == [[Double]]() {
            self.numbers = Array(repeating: Array(repeating: 0.0, count: cols), count: rows)
            
            for i in 0..<self.rows {
                self.numbers[i][i] = 1.0
            }
            return
        }
        
        guard numbers.count == rows else {
            print("Your array cannot conform to matrix structure")
            throw MatrixError.IncorrectInput
        }
        
        for i in 0..<rows {
            guard numbers[i].count == cols else {
                print("Your array cannot conform to matrix structure")
                throw MatrixError.IncorrectInput
            }
        }
        
        self.numbers = numbers
    }
    
    mutating func multiply(by digit: Double) {
        for i in 0..<rows {
            for j in 0..<cols {
                self.numbers[i][j] *= digit
            }
        }
    }
    
    mutating func transpose() {
        let tmp = self
        self.cols = tmp.rows
        self.rows = tmp.cols
        for i in 0..<self.rows {
            for j in 0..<self.cols {
                self.numbers[j][i] = tmp.numbers[i][j]
            }
        }
    }
    
    func symmetrical() -> Bool {
        var tmp = self
        tmp.transpose()
        return (self.numbers == tmp.numbers)
    }
    
    func skew_symmetrical() -> Bool {
        var tmp = self
        tmp.transpose()
        for i in 0..<self.rows {
            for j in 0..<self.cols {
                if self.numbers[i][j] != -tmp.numbers[i][j] {
                    return false
                }
            }
        }
        return true
    }
    
    mutating func minus() {
        self.multiply(by: -1)
    }
    
    func orthogonal() -> Bool {
        var A = self
        A.transpose()
        
        let E = try! Matrix(rows: self.rows, cols: self.cols)
        
        let B = try! self * A
        
        return B.isEqual(to: E)
    }
    
    func isEqual(to A: Matrix) -> Bool {
        return self.numbers == A.numbers
    }
    
    func square() throws {
        if self.cols != self.rows {
            print("Error")
            throw MatrixError.differentTypes
        }
    }
    
    func tr() throws -> Double {
        try self.square()
        
        var sum = 0.0
        
        for i in 0..<self.rows {
            sum += self.numbers[i][i]
        }
        
        return sum
    }
    
    func rank() -> Int {
        var rank = 0
        var minor: Matrix
        
        for k in 1... {
            minor = try! Matrix(rows: k, cols: k)
            
            //this is fucking tought !!!
            
            if try! det(minor) == 0 {
                
            }
        }
        
        return rank
    }
    
    func inverse() {
        
    }
}
