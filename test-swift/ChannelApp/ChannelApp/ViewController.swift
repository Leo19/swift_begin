//
//  ViewController.swift
//  ChannelApp
//
//  Created by liushun on 15/10/13.
//  Copyright © 2015年 liushun. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    var channels:Array<Dictionary<String,String>> = [
        ["name":"CCTV5","url":"http://ims.veryhd.net"],
        ["name":"芒果台","url":"http://www.hunantv.com"],
        ["name":"凤凰卫视","url":"http://www.ifeng.com"],
        ["name":"CCTV6","url":"http://cctv6.com"]
    ]
    //var channel = ["CCTV5","芒果TV","凤凰卫视","CCTV6"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        print("10000")
        return channels.count
    }
    

    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cellName = ""
        if indexPath.row % 2 == 0{
            cellName = "cell2"
        }else{
            cellName = "cell1"
        }
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier(cellName,forIndexPath : indexPath) as UITableViewCell
        var channel:Dictionary<String,String> = channels[indexPath.row]
        cell.textLabel?.text = channel["name"]
        print(indexPath)
        return cell
    }
    
    internal func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        var channel:Dictionary<String,String> = channels[indexPath.row]
        let name = channel["name"]
        let url = channel["url"]
        print("did select line \(name) \(url)")
    }

}

