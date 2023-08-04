//
//  ViewController.swift
//  Calculator
//
//  Created by 新翌王 on 2023/2/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var InTheMiddleOfTyping = false
    var Isfloating = false
    
    @IBAction func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        print("\(digit) was touched")
        
        if digit == "." {
            InTheMiddleOfTyping = true
        }
        
        if !(Isfloating && digit == ".") {
            if InTheMiddleOfTyping {
                let textCurrentlyInDisplay = display.text!
                display.text = textCurrentlyInDisplay + digit
            }
            else {
                display.text = digit
                InTheMiddleOfTyping = true
            }
        }
    }
    
    var operand1 = 0.0
    var symbolOfOperation = ""
    
    @IBAction func performOperation(_ sender: UIButton) {
        let Operation = sender.currentTitle!
        switch Operation {
        case "AC":
            display.text = "0"
            InTheMiddleOfTyping = false
            break;
        case "√":
            let operand = Double(display.text!)!
            display.text = String(sqrt(operand))
            InTheMiddleOfTyping = false
            break;
        case "+":
            operand1 = Double(display.text!)!
            symbolOfOperation = "+"
            InTheMiddleOfTyping = false
            break;
        case "-":
            operand1 = Double(display.text!)!
            symbolOfOperation = "-"
            InTheMiddleOfTyping = false
            break;
        case "x":
            operand1 = Double(display.text!)!
            symbolOfOperation = "x"
            InTheMiddleOfTyping = false
            break;
        case "÷":
            operand1 = Double(display.text!)!
            symbolOfOperation = "÷"
            InTheMiddleOfTyping = false
            break;
        case "%":
            operand1 = Double(display.text!)!
            symbolOfOperation = "%"
            InTheMiddleOfTyping = false
            break;
        case "±":
            let operand = Double(display.text!)!
            display.text = String(-operand)
            break;
        case "=":
            if(symbolOfOperation != "") {
                let operand2 = Double(display.text!)!
                switch symbolOfOperation {
                case "+":
                    display.text = String(operand1 + operand2)
                    break
                case "-":
                    display.text = String(operand1 - operand2)
                    break
                case "x":
                    display.text = String(operand1 * operand2)
                    break
                case "÷":
                    display.text = String(operand1 / operand2)
                    break
                case "%":
                    display.text = String(Int(operand1) % Int(operand2))
                    break
                default:
                    break
                }
                InTheMiddleOfTyping = false
                symbolOfOperation = ""
            }
        default:
            break
        }
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

