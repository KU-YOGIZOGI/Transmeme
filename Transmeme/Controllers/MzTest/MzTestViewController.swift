//
//  MzTestViewController.swift
//  Transmeme
//
//  Created by 홍서린 on 12/15/23.
//

import Foundation
import UIKit
import Then
import SnapKit

class MzTestViewController : UIViewController {
    
    let transLogoEn = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.image = UIImage(named: "title_enx1")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        
    }
    
    func setUp() {
        
        self.view.backgroundColor = .white
        
        view.addSubview(transLogoEn)
        
        transLogoEn.snp.makeConstraints{
            $0.top.equalTo(100)
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(45)
        }
        
    }
    
}
