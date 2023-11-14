//
//  TestEndViewConroller.swift
//  Transmeme
//
//  Created by 정아현 on 11/13/23.
//

import UIKit
import SnapKit
import Then

class TestEndViewController: UIViewController {
    let background = UIView().then { $0.backgroundColor = UIColor.black.withAlphaComponent(0.3) }
    // 팝업 하얀색 배경
    let popUpView = UIView().then {
        $0.backgroundColor = UIColor.white
        $0.layer.cornerRadius = 10
    }
    let xButton = UIButton().then { $0.setImage(UIImage(named: "close"), for: .normal) }
    let endLabel = UILabel().then {
        $0.text = "테스트를 완료하였습니다!"
        $0.textColor = UIColor.black
        $0.font = UIFont(name: "GmarketSansMedium", size: 25)
        $0.numberOfLines = 0
    }
}

class LogoutPopUpViewController: UIViewController {
    // 배경 - black 투명도 30%
    let background = UIView().then {
        $0.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    }
    
    // 팝업
}
