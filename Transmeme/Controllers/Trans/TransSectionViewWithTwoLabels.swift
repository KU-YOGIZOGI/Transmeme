//
//  TransSectionViewWithTwoLabels.swift
//  Transmeme
//
//  Created by 홍서린 on 2023/11/11.
//

import Foundation
import UIKit
import Then
import SnapKit

class TransSectionViewWithTwoLabels: TransSectionView {
    let secondContentLabel = UILabel().then {
        $0.textColor = UIColor(r: 152, g: 152, b: 152)
        $0.font = UIFont(name: "GmarketSansLight", size: 10)
        $0.numberOfLines = 0
    }

    convenience init(title: String, firstContent: String, secondContent: String) {
        self.init(frame: .zero)
        titleLabel.text = title
        contentLabel.text = firstContent
        secondContentLabel.text = secondContent
        
        setupLayout()
        addSubview(secondContentLabel)
        
        setupLayoutWithTwoLabels()
    }

    private func setupLayoutWithTwoLabels() {
        addSubview(secondContentLabel)
        
        contentLabel.snp.remakeConstraints {
                 $0.top.equalTo(titleLabel.snp.bottom).offset(5)
                 $0.leading.equalTo(titleLabel.snp.leading).offset(10)
                 $0.trailing.lessThanOrEqualTo(secondContentLabel.snp.leading).offset(0)
             }
        
        secondContentLabel.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.top)
            $0.leading.equalTo(contentLabel.snp.trailing)
            $0.height.equalTo(13)
            $0.width.equalTo(20)
        }
    }
}
