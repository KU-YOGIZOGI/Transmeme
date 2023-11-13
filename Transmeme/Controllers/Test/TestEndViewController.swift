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
    let xButton = UIButton().then { $0.setImage(UIImage(named: "closeBtn"), for: .normal) }
}
