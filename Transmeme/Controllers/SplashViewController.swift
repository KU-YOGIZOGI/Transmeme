////
////  SplashViewController.swift
////  Transmeme
////
////  Created by 홍서린 on 2023/11/08.
////
//
//import Foundation
//import UIKit
//
//class SplashViewController: UIViewController{
//    
//    var splashCompletion: (() -> Void)?
//    
//    private let logoImage: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "Splash")
//        return imageView
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.view.backgroundColor = UIColor(red: 1.0, green: 0.87, blue: 0.85, alpha: 1.0)
//        
//        // 스플래시 화면을 나타내는 로직 및 딜레이 등을 구현
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//            // 스플래시 화면이 표시된 후에 호출되어야 할 코드
//            self.splashCompletion?()
//        }
//        
//        view.addSubview(logoImage)
//        
//        self.logoImage.snp.makeConstraints { make in
//            make.centerX.equalTo(view.snp.centerX)
//            make.centerY.equalTo(view.snp.centerY)
//            make.height.equalTo(94)
//            make.width.equalTo(142)
//        }
//        
//    }
//}
