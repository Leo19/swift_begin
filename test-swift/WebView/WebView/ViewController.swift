//
//  ViewController.swift
//  WebView
//
//  Created by liushun on 15/10/16.
//  Copyright © 2015年 liushun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // 网址输入框和现实网站内容的版块
    @IBOutlet var webSite: UITextField!
    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 创建一个可以访问的URL对象，2.0版本后面要加感叹号
        let url: NSURL = NSURL(string: "http://www.baidu.com")!
        let request: NSURLRequest = NSURLRequest(URL: url)
        
        // 加载网页
        self.webView.loadRequest(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func confirm(sender: AnyObject) {
        var str: String = webSite.text!
        if !str.hasPrefix("http://"){
            str = "http://" + str
        }
        
        let url: NSURL = NSURL(string: str)!
        let request: NSURLRequest = NSURLRequest(URL: url)
        
        // 加载网页
        self.webView.loadRequest(request)
    }
}

