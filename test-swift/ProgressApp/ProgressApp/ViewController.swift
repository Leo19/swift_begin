//
//  ViewController.swift
//  ProgressApp
//
//  Created by liushun on 15/11/10.
//  Copyright © 2015年 liushun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 测试的view self.addSubview的时候，控件的可见性和代码顺序有关
        let tempView = UIView(frame: CGRectMake(100,280,100,100))
        tempView.backgroundColor = UIColor.greenColor()
        
        // 用代码创建一个UIPageControl，对于PageController来说设置高度也没用
        let page = UIPageControl(frame: CGRectMake(10,10,100,20))
        page.numberOfPages = 4
        page.currentPage = 2
        page.pageIndicatorTintColor = UIColor.blueColor()
        page.currentPageIndicatorTintColor = UIColor.lightGrayColor()
        page.addTarget(self, action: "pageControl:", forControlEvents: .ValueChanged)
        self.view.addSubview(page)
        self.view.addSubview(tempView)
        
        // 用代码创建一个进度条，指定简单的属性
        let pgView = UIProgressView(progressViewStyle: .Default)
        pgView.frame = CGRectMake(100, 400, 88, 3)
        
        // 颜色的值是RGB的值除255
        pgView.tintColor = UIColor(red: 255/255, green: 102/255, blue: 102/255, alpha: 1)
        pgView.progress = 0.5
        self.view.addSubview(pgView)
    }

    @IBAction func didChanged(sender: UISlider) {
        print(sender.value)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // 单击中心点的左边和右边才有效，不能单击那个中心点
    @IBAction func pageControl(sender: UIPageControl) {
        print("\(sender.currentPage)")
    }
    
    

}

