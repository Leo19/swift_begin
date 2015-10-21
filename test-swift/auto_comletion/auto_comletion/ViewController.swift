//
//  ViewController.swift
//  auto_comletion
//
//  Created by liushun on 15/9/10.
//  Copyright (c) 2015年 刘顺. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.redColor()
        self.view.backgroundColor = UIColor.greenColor()
        self.view.backgroundColor = UIColor.yellowColor()
        self.view.backgroundColor = UIColor.yellowColor()
        var 🐶🐮 = "dogcow"
        println(🐶🐮)
        for index in 1...10{
            var count = arc4random_uniform(100)
            println("this is a random int \(count)")
            switch count{
            case 0:
                break
            case 1...59:
                println("只是不及格哎")
            case 60...70:
                println("马马虎虎")
            case 71...80:
                println("还不错了啦")
            case 81...90:
                println("好")
            case 91...99:
                println("优秀")
            case 100:
                println("真棒")
            default:
                break
            }

        }
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

