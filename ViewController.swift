//
//  ViewController.swift
//  iOSCalculator
//
//  Created by Trevor Allen on 4/28/16.
//  Copyright © 2016 Trevor Allen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var numQueueLabel: UILabel!
    @IBOutlet var operationLabel: UILabel!
    var numQueue : [Int] = []
    var operation : String = ""
    var answer : Int = 0
    var newCalculation : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        operationLabel.text = "";
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func add(x: Int, y: Int) -> Int {
        return x + y;
    }
    
    func subtract(x: Int, y: Int) -> Int {
        return x - y;
    }
    
    func multiply(x: Int, y: Int) -> Int {
        return x * y;
    }
    
    func divide(x: Int, y: Int) -> Int {
        return x / y;
    }
    
    func mod(x: Int, y: Int) -> Int {
        return x % y;
    }
    
    func count(x: [Int]) -> Int {
        return x.count
    }
    
    func average(x: [Int]) -> Int {
        var sum = 1;
        for num in x {
            sum += num
        }
        return sum / x.count
    }
    
    func factorial(x: Int) -> Int {
        var sum = 1;
        if x > 0 {
            for num in 1...x {
                sum *= num
            }
        }
        return sum
    }
    
    @IBAction func number(sender: UIButton) {
        if newCalculation {
            operationLabel.text = ""
            newCalculation = !newCalculation
        }
        operationLabel.text = operationLabel.text! + sender.currentTitle!
    }
    
    @IBAction func basicCalc(sender: UIButton) {
        if numQueue.count < 2 {
            if operationLabel.text != "" && numQueue.count == 0 {
                numQueue.append(Int(operationLabel.text!)!)
                operationLabel.text = ""
            }
            operation = sender.currentTitle!
            numQueueLabel.text = "\(operation) \(numQueue)"
        }
    }
    
    @IBAction func multiCalc(sender: UIButton) {
        if operationLabel.text != ""  {
            numQueue.append(Int(operationLabel.text!)!)
            operationLabel.text = ""
        }
        operation = sender.currentTitle!
        numQueueLabel.text = "\(operation) \(numQueue)"
    }
    
    @IBAction func fact(sender: UIButton) {
        if numQueue.count == 0 {
            numQueue.append(Int(operationLabel.text!)!)
            operationLabel.text = ""
            operation = sender.currentTitle!
            numQueueLabel.text = "\(operation) \(numQueue)"
        }
    }

    @IBAction func equals(sender: UIButton) {
        switch operation {
        case "add":
            if operationLabel.text != "" {
                answer = add(numQueue[0], y: Int(operationLabel.text!)!)
            }
            
            break
        case "subtract":
            if operationLabel.text != "" {
                answer = subtract(numQueue[0], y: Int(operationLabel.text!)!)
            }
            break
        case "multiply":
            if operationLabel.text != "" {
                answer = multiply(numQueue[0], y: Int(operationLabel.text!)!)
            }
            break
        case "divide":
            if operationLabel.text != "" {
                answer = divide(numQueue[0], y: Int(operationLabel.text!)!)
            }
            break
        case "mod":
            if operationLabel.text != "" {
                answer = mod(numQueue[0], y: Int(operationLabel.text!)!)
            }
            break
        case "count":
            answer = count(numQueue)
            break
        case "avg":
            answer = average(numQueue)
            break
        case "fact":
            answer = factorial(numQueue[0])
            break
        default:
            break
        }
        operationLabel.text = "\(answer)"
        numQueue = []
        numQueueLabel.text = "\(numQueue)"
        operation = ""
        newCalculation = true
    }
}

