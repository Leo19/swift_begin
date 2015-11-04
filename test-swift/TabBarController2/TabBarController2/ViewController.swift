//
//  ViewController.swift
//  TabBarController2
//
//  Created by liushun on 15/11/3.
//  Copyright © 2015年 liushun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 起始页创建一个开始按钮
        let button: UIButton = UIButton(type: UIButtonType.System)
        button.frame = CGRectMake(100, 150, 100, 30)
        button.setTitle("Go.....", forState: .Highlighted)
        button.addTarget(self, action: Selector("tapped"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
    }
    
    // 点击后切换到后面的Tab Bar上
    func tapped(){
        self.presentViewController(MainTabViewController(), animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

