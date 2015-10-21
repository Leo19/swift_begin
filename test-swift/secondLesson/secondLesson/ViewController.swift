//
//  ViewController.swift
//  secondLesson
//
//  Created by liushun on 15/9/9.
//  Copyright (c) 2015年 liushun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var screen: UILabel!
    
    var operand1: String = ""
    var operand2: String = ""
    var operators: String = ""
    let (x,y,z,a,b,c) = (1,2,3,4,5,6)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        println("this is a constant:"+a.description)
        let base = 3
        let power = 10
        var answer = 1
        for _ in 1...power{
            answer *= base
            println(answer)
        }
        
        let names = ["Anna","Alex","Brain","Jack"]
        for name in names{
            println("Hello,\(name)")
        }
        
        let numberOfLegs = ["spider":8,"ant":6,"cat":4]
        for(animalName,_) in numberOfLegs{
            println("\(animalName)s have \(numberOfLegs[animalName]) legs")
        }
        
        for character in "Hello"{
            println("every character:\(character)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    @IBAction func didClicked(sender: UIButton) {
        var value:String = sender.currentTitle!
        println(sender.currentTitle)
        if(operators == ""){
            operand1 = operand1 + value
        }else{
            operand2 = operand2 + value
        }
        screen.text = screen.text! + value
    }
    @IBAction func didOperator(sender: UIButton) {
        operators = sender.currentTitle!
        println(operators)
        screen.text = screen.text! + operators
        return
    }
    @IBAction func count(sender: UIButton) {
        var result:Int = 0
        switch operators{
        case "+":
            result = operand1.toInt()! + operand2.toInt()!
        case "-":
            result = operand1.toInt()! - operand2.toInt()!
        case "*":
            result = operand1.toInt()! * operand2.toInt()!
        case "/":
            result = operand1.toInt()! / operand2.toInt()!
        default:
            result = 0
        }
        
        screen.text = "\(result)"
    }
}

