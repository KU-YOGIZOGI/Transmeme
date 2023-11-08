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
        tabBar.layer.cornerRadius = tabBar.frame.height * 0.41
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        
        // 그림자 레이어 생성
        tabBar.layer.masksToBounds = false
        tabBar.layer.shadowColor = UIColor.black.cgColor
        tabBar.layer.shadowOpacity = 0.5
        tabBar.layer.shadowOffset = CGSize(width: 0, height: 2)
        tabBar.layer.shadowRadius = 4 // 그림자의 블러 반경 (선택적으로 조절)
        
        let attributes = [NSAttributedString.Key.font: UIFont(name: "GmarketSansMedium", size: 11)!]
        
        let transVC = TransViewController()
        let testVC = TestViewController()
        let dicVC = DicViewController()
        
        transVC.title = "홈"
        testVC.title = "시험"
        dicVC.title = "도감"
        
        transVC.tabBarItem.image = UIImage(named: "homeIconx1")
        testVC.tabBarItem.image = UIImage(named: "testIconx1")
        dicVC.tabBarItem.image = UIImage(named: "dicIconx1")
        
        transVC.tabBarItem.setTitleTextAttributes(attributes, for: .normal)
        testVC.tabBarItem.setTitleTextAttributes(attributes, for: .normal)
        dicVC.tabBarItem.setTitleTextAttributes(attributes, for: .normal)
        
        // 아이콘 크기 조절
        transVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        testVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        dicVC.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        
        
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
