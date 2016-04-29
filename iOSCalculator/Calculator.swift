//
//  Calculator.swift
//  iOSCalculator
//
//  Created by Trevor Allen on 4/29/16.
//  Copyright © 2016 Trevor Allen. All rights reserved.
//

import Foundation

public class Calculator {
    public var history : [String] = [String]()
    
    private static let _instance : Calculator = Calculator()
    
    public static var Instance : Calculator {
        get {return _instance}
    }
    
    public func add(x: Int, y: Int) -> Int {
        history.append("\(x) + \(y)")
        return x + y;
    }
    
    public func subtract(x: Int, y: Int) -> Int {
        history.append("\(x) - \(y)")
        return x - y;
    }
    
    public func multiply(x: Int, y: Int) -> Int {
        history.append("\(x) x \(y)")
        return x * y;
    }
    
    public func divide(x: Int, y: Int) -> Int {
        history.append("\(x) / \(y)")
        return x / y;
    }
    
    public func mod(x: Int, y: Int) -> Int {
        history.append("\(x) % \(y)")
        return x % y;
    }
    
    public func count(x: [Int]) -> Int {
        history.append("count \(x)")
        return x.count
    }
    
    public func average(x: [Int]) -> Int {
        history.append("average \(x)")
        var sum = 1;
        for num in x {
            sum += num
        }
        return sum / x.count
    }
    
    public func factorial(x: Int) -> Int {
        history.append("\(x)!")
        var sum = 1;
        if x > 0 {
            for num in 1...x {
                sum *= num
            }
        }
        return sum
    }

}