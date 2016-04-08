//
//  ViewController.swift
//  arraySetDictionary
//
//  Created by liushun on 15/11/17.
//  Copyright © 2015年 liushun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /* Optional嵌套带来的一些问题，如果能不用尽量就不要用嵌套，下面的例子说明 */
        /* 这个按理说swift是强数据类型语言，如果等号两边的类型不一样的话编译不过 */
        /* 但是下面的b和c却不是nil，整个Optional类型的嵌套内存中它实际上是二叉树 */
        /* 左子节点是.None右子节点是.Some等于是一个泛型Optional<Optional<T>> */
        let a: Int? = nil
        let b: Int?? = a
        let c: Int??? = b
        let d: Int??? = nil
        
        /* 打上断点后，在LLDB中用 fr v -R a(变量名)可以看到如下情况 */
        /* (lldb)fr v -R a */
        /* (Swift.Optional<Swift.Int>) a = None{            */
        /*   Some = {                                       */
        /*     value = 0                                    */
        /*   }                                              */
        /* }                                                */
        /*                                                  */
        /* (lldb)fr v -R b                                  */
        /* (Swift.Optional<Swift.Optional<Swift.Int>>) b = Some {*/
        /*   Some = None {                                  */
        /*     Some = {                                     */
        /*       value = 0                                  */
        /*     }                                            */
        /*   }                                              */
        /* }                                                */
        /*                                                  */
        /* 变量c因为是多层嵌套的nil，所以它在最外层的二叉树上的值，是Optional<Optional<Int>> */
        /* 变量d因为直接赋nil所以最外层是一个Optional.None，所以b/c用if let判断是否为nil失效了 */
        if let _ = b {
            print(" b is not none")
        }
        
        if let _ = c {
            print(" c is not none")
        }
        
        if let _ = d {
            print(" d is not none")
        }
    }
    
    // 还有一个关于在字典中把value置nil来删除该数据的例子，是傅若愚在Swift大会上的分享在，在NestedDict.playground中

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

