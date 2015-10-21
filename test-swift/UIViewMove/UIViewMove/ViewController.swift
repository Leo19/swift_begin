//
//  ViewController.swift
//  UIViewMove
//
//  Created by liushun on 15/10/12.
//  Copyright © 2015年 liushun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var greenView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    func moveToLeft(){
        var currentFrame = greenView.frame
        print("====:1234")
        var destFrame = CGRect(x:currentFrame.origin.x-10,y:currentFrame.origin.y,width:currentFrame.size.width,height:currentFrame.size.height)
        print("####:2234")
        greenView.frame = destFrame    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didMoveToTheLeft(sender: UIButton) {
        moveToLeft()
    }


    @IBAction func leftGesture(sender: AnyObject) {
    
        moveToLeft()
    }
    
}

