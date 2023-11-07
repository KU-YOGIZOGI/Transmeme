//
//  TabBarViewController.swift
//  Transmeme
//
//  Created by 홍서린 on 2023/11/08.
//

import Foundation
import UIKit

class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = .white
        
        let transVC = TransViewController()
        let testVC = ViewController()
        let dicVC = DicViewController()
        
        transVC.title = "홈"
        testVC.title = "시험"
        dicVC.title = "도감"
        
        transVC.tabBarItem.image = UIImage(named: "homeIconx1")
        testVC.tabBarItem.image = UIImage(named: "testIconx1")
        dicVC.tabBarItem.image = UIImage(named: "dicIconx1")
        
//        //타이틀 text를 항상 크게보이게 설정
//        transVC.navigationItem.largeTitleDisplayMode = .always
//        testVC.navigationItem.largeTitleDisplayMode = .always
//        dicVC.navigationItem.largeTitleDisplayMode = .always
        
        //navigationController의 root view 설정
        let navTrans = UINavigationController(rootViewController: transVC)
        let navTest = UINavigationController(rootViewController: testVC)
        let navDic = UINavigationController(rootViewController: dicVC)
        
        navTrans.isNavigationBarHidden = true
        navTest.isNavigationBarHidden = true
        navDic.isNavigationBarHidden = true
        
        navigationController?.isNavigationBarHidden = true
        
        setViewControllers([navTrans,navTest,navDic], animated: false)
        
    }
}
