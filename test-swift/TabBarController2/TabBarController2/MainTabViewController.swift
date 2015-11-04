//
//  MainTabViewController.swift
//  TabBarController2
//
//  Created by liushun on 15/11/3.
//  Copyright © 2015年 liushun. All rights reserved.
//

import UIKit

class MainTabViewController: UITabBarController{
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        // 创建两个view
        let viewMain = MainViewController()
        viewMain.title = "first"
        let viewSetting = SettingViewController()
        viewSetting.title = "second"
        
        // 分别声明两个NavigationController
        let main = UINavigationController(rootViewController: viewMain)
        main.tabBarItem.image = UIImage(named: "first")
        
        let setting = UINavigationController(rootViewController: viewSetting)
        setting.tabBarItem.image = UIImage(named: "second")
        self.viewControllers = [main,setting]
        
        // 默认选中第一个
        self.selectedIndex = 0
    }
}
