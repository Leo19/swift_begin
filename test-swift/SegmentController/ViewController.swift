//
//  ViewController.swift
//  SegmentController
//
//  Created by liushun on 15/11/5.
//  Copyright © 2015年 liushun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 用代码的方式创建一个分段并设置一些属性，还有用story board画了三个段
        // 每个小段上的title和image属性是互斥的只能设置一个
        let items = ["Mon","The","Wed"]
        let segments = UISegmentedControl(items: items)
        
        segments.addTarget(self, action: "didChangeValue:", forControlEvents: UIControlEvents.ValueChanged)
        segments.frame = CGRectMake(100, 50, 100, 50)
        segments.selectedSegmentIndex = 0
        segments.momentary = true
        segments.widthForSegmentAtIndex(0)
        self.view.addSubview(segments)
    }
    
    func didChangeValue(sender: UISegmentedControl){
        print("this is index of \(sender.selectedSegmentIndex)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

