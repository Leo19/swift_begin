//
//  ViewController.swift
//  FirstLesson
//
//  Created by liushun on 15/9/6.
//  Copyright (c) 2015年 liushun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    @IBOutlet var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.text1.text = "中文文本框内容实验";
        println("what is this poem")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didClicked(sender: UIButton) {
        var countResult = 0
        println("button clicked!")
        println(self.text1.text)
        // String xxx
        var val1 = self.text1.text.toInt()
        var val2 = self.text2.text.toInt()
        countResult = val1! + val2!
        println("result = \(countResult)")
        self.resultLabel.text = "\(countResult)"
    }
}

