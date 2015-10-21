//
//  ViewController.swift
//  HanggeWebView
//
//  Created by liushun on 15/10/16.
//  Copyright © 2015年 liushun. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIWebViewDelegate,UITextFieldDelegate{
    // 前往按钮
    @IBOutlet var btngo: UIButton!
    // 显示网页
    @IBOutlet var webview: UIWebView!
    // 网址
    @IBOutlet var txtUrl: UITextField!
    
    var loadIndicator: UIActivityIndicatorView!
    
    // 进度条计时器
    var ptimer:NSTimer!
    // 进度条控件
    var progBar:UIProgressView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.webview.delegate = self
        loadIndicator = UIActivityIndicatorView(frame: CGRectMake(100.0, 100.0,32.0,32.0))
        loadIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        self.view.addSubview(loadIndicator)
        
        txtUrl.delegate = self
        
        
        // 生成浏览器工具条
        setupBrowserToolbar()
    }
    
    func setupBrowserToolbar(){
        // 创建一个浏览器工具条，并设置它的大小和位置
        let browserToolbar = UIToolbar(frame: CGRectMake(0, 20, 320, 44))
        
        // 将工具条添加到当前应用的界面中
        self.view.addSubview(browserToolbar)
        
        // 创建图片工具条，以NSData方式初始化UIImage
        let path = NSBundle.mainBundle().pathForResource("back", ofType: "png")
        
        let urlStr = NSURL.fileURLWithPath(path!)
        let data = NSData(contentsOfURL: urlStr)
        
        // 后退按钮
        let btnback = UIBarButtonItem(image: UIImage(data:data!),style: UIBarButtonItemStyle.Bordered, target: self, action: Selector("backClicked:"))
        
        // 第一个分隔按钮
        let btngap1 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        // 前进按钮
        let btnforward = UIBarButtonItem(image: UIImage(named: "forward.png"),style: UIBarButtonItemStyle.Plain,target:self , action:Selector("forwardClicked:"))
        
        // 第二个分隔按钮，可伸缩的UIBarButtonItem
        let btngap2 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        // 重新加载按钮 UIBarButtonItem
        let btnreload = UIBarButtonItem(image: UIImage(named: "reload.png"),style: UIBarButtonItemStyle.Plain, target:self , action: Selector("reloadClicked"))
        
        // 第三个分隔按钮
        let btngap3 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        // 停止按钮
        let btnstop = UIBarButtonItem(image: UIImage(named: "stop"), style: UIBarButtonItemStyle.Plain, target: self , action: Selector("stopClicked:"))
        
        // 第四个分隔按钮
        let btngap4 = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        
        // 进度条
        progBar = UIProgressView(progressViewStyle: UIProgressViewStyle.Bar)
        progBar.progress = 0
        
        // 创建使用UIView 自定义的UIBarButtonItem
        let btnprog = UIBarButtonItem(customView: progBar)
        
        // 为工具条设置工具按钮
        browserToolbar.setItems([btnback,btngap1,btnforward,btngap2,btnreload,btngap3,btnstop,btngap4,btnprog], animated: true)
        
        // 创建计时器对象
        ptimer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self , selector: Selector("loadProgress"), userInfo: nil, repeats: true)
        ptimer.invalidate()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        txtUrl.resignFirstResponder()
        print("url changed")
        let url = txtUrl.text
        loadUrl(url!)
        return true
    }
    
    func loadUrl(url:String){
        let urlobj = NSURL(string: url)
        let request = NSURLRequest(URL: urlobj!)
        webview.loadRequest(request)
    }
    
    func stopClicked(sender: UIBarButtonItem){
        webview.stopLoading()
    }

    func reloadClicked(sender: UIBarButtonItem){
        webview.reload()
    }
    
    func backClicked(sender: UIBarButtonItem){
        webview.goBack()
    }
    
    func forwardClicked(sender: UIBarButtonItem){
        webview.goForward()
    }
    
    @IBAction func goClicked(sender: UIButton) {
        // 收起输入面板
        txtUrl.resignFirstResponder()
        let url = txtUrl.text
        loadUrl(url!)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func webViewDidStartLoad(webView: UIWebView) {
        progBar.setProgress(0, animated: false)
        ptimer.fire()
        loadIndicator.startAnimating()
    }
    
    func loadProgress(){
        if progBar.progress >= 1.0{
            ptimer.invalidate()
        }else{
            progBar.setProgress(progBar.progress + 0.02, animated: true)
        }
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        let alertview = UIAlertView()
        alertview.title = "procedure error"
        alertview.message = error?.localizedDescription
        alertview.addButtonWithTitle("sure")
        alertview.show()
    }
}

