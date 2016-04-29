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
    
    @IBAction func done(segue: UIStoryboardSegue) {
        
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
        if operationLabel.text != ""  && !newCalculation {
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
                answer = Calculator.Instance.add(numQueue[0], y: Int(operationLabel.text!)!)
            }
            
            break
        case "subtract":
            if operationLabel.text != "" {
                answer = Calculator.Instance.subtract(numQueue[0], y: Int(operationLabel.text!)!)
            }
            break
        case "multiply":
            if operationLabel.text != "" {
                answer = Calculator.Instance.multiply(numQueue[0], y: Int(operationLabel.text!)!)
            }
            break
        case "divide":
            if operationLabel.text != "" {
                answer = Calculator.Instance.divide(numQueue[0], y: Int(operationLabel.text!)!)
            }
            break
        case "mod":
            if operationLabel.text != "" {
                answer = Calculator.Instance.mod(numQueue[0], y: Int(operationLabel.text!)!)
            }
            break
        case "count":
            answer = Calculator.Instance.count(numQueue)
            break
        case "avg":
            answer = Calculator.Instance.average(numQueue)
            break
        case "fact":
            answer = Calculator.Instance.factorial(numQueue[0])
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

