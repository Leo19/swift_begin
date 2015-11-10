//
//  ViewController.swift
//  SliderApp
//
//  Created by liushun on 15/11/6.
//  Copyright © 2015年 liushun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 手动创建一个slider
        let slider = UISlider(frame: CGRectMake(100,300,100,30))
        slider.minimumValue = 10
        slider.maximumValue = 200
        slider.value = 50
        slider.continuous = true
        slider.minimumTrackTintColor = UIColor.redColor()
        slider.maximumTrackTintColor = UIColor.greenColor()
        slider.thumbTintColor = UIColor.brownColor()
        slider.addTarget(self, action: "didChanged:", forControlEvents: .ValueChanged)
        self.view.addSubview(slider)
        
        // 手动创建一个switch 位置x，y坐标起作用，后面的大小设置了也不起作用
        let sw = UISwitch(frame: CGRectMake(100,400,100,30))
        sw.addTarget(self, action: "didSwitched:", forControlEvents: .ValueChanged)
        sw.onTintColor = UIColor.blueColor()
        sw.tintColor = UIColor.greenColor()
        sw.thumbTintColor = UIColor.redColor()
        self.view.addSubview(sw)
    }
    
    // 滑动和滑动结束的时候都会触发这个事件，这个value是浮点数
    @IBAction func didChanged(sender: UISlider) {
        print("\(sender.value)")
    }
    
    @IBAction func didSwitched(sender: UISwitch) {
        print("\(sender.on)")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

