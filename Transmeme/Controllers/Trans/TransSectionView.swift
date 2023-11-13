//
//  TransSectionView.swift
//  Transmeme
//
//  Created by 홍서린 on 2023/11/10.
//

import Foundation
import UIKit
import Then
import SnapKit

class TransSectionView: UIView {
    
    let titleLabel = UILabel().then {
        $0.font = UIFont(name: "GmarketSansMedium", size: 12)
        $0.textColor = UIColor(r:0, g:9, b:81)
    }
    
    let contentLabel = UILabel().then {
        $0.textColor = .black
        $0.font = UIFont(name: "GmarketSansLight", size: 12)
        $0.numberOfLines = 0
    }
    
    convenience init(title: String, content: String) {
        self.init(frame: .zero)
        titleLabel.text = title
        contentLabel.text = content
        setupLayout()
    }
 
    
     func setupLayout() {
        
        addSubview(titleLabel)
        addSubview(contentLabel)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.left.right.equalToSuperview()
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.leading.equalTo(titleLabel.snp.leading).offset(10)
            $0.trailing.equalToSuperview()
        }
        

    }
}
