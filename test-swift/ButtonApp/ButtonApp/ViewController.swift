//
//  ViewController.swift
//  ButtonApp
//
//  Created by liushun on 15/10/15.
//  Copyright © 2015年 liushun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 创建一个ContactAdd类型的按钮
        let button:UIButton = UIButton(type: .ContactAdd)
        button.frame = CGRectMake(10, 150, 100, 30)
        
        // 设置按钮文字----普通 Normal 高亮 HighLighted 禁用 Disabled
        self.view.addSubview(button)
        button.setTitle("按钮", forState: .Normal)
        button.setTitle("高亮", forState: .Highlighted)
        button.setTitle("禁用", forState: UIControlState.Disabled)
        button.setTitleColor(UIColor.blueColor() ,forState: UIControlState.Normal)
        button.setTitleColor(UIColor.greenColor(), forState: UIControlState.Highlighted)
        button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        
        // 按钮背景颜色
        button.backgroundColor = UIColor.brownColor()
        
        // 设置按钮背景图片
        //button.setBackgroundImage(UIImage(named: "bg1"), forState: .Normal)
        
        
        
        // 调用传递和非传递对象的方法区别只在于方法名后面加了冒号：
        button.addTarget(self, action: Selector("didClick"), forControlEvents: UIControlEvents.TouchDown)
        button.addTarget(self, action: Selector("didClickButton:"), forControlEvents:UIControlEvents.TouchUpInside)
    }
    
    // 点按钮的时候不传递点击的对象时方法不用加UIButton参数
    func didClick(){
        print("click button")
    }
    
    // 定义传递点击对象的方法时要给参数，而且方法被调用时方法名后面跟冒号
    func didClickButton(button:UIButton){
        print("this button was clicked")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

