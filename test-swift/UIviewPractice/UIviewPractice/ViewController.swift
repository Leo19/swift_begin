//
//  ViewController.swift
//  UIviewPractice
//
//  Created by liushun on 15/10/10.
//  Copyright © 2015年 liushun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var redview: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        redview.frame = CGRect(x:15,y:15,width:240,height:350)
        let cgrect = CGRect(x:10,y:10,width:25,height:25)
        let yellowView = UIView(frame:cgrect)
        yellowView.backgroundColor = UIColor.yellowColor()
        
        redview.addSubview(yellowView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

