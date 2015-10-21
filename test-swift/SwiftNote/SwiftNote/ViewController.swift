//
//  ViewController.swift
//  SwiftNote
//
//  Created by liushun on 15/9/17.
//  Copyright (c) 2015年 liushun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var noteTextView: UITextView!
    var array = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var result:Int = myFunction(label:200,label1 : 400)
        println("result:\(result)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func saveClicked(sender: AnyObject) {
        var realText:String = noteTextView.text
        println(realText)
        array.append(realText)
    }

    
    @IBAction func printArray(sender: UIButton) {
        // 第一种遍历方法
        for var index = 0;index < array.count;++index{
            println(array[index])
        }
        //var realText = noteTextView.text
        //array.append(realText)
        
        // 第二种遍历方法
        var index = 0
        if(array.count > 0){
            for index in 0...array.count-1{
                println(array[index])
            }
        }
        
        for textIndex in array{
            println(textIndex)
        }
    }
    @IBAction func tapGesture(sender: AnyObject) {
        self.view.endEditing(true)
    }
    
    func myFunction(label a : Int, label1 b : Int) -> Int{
        println("hello,kitty \(a),\(b)")
        return a + b
    }
}