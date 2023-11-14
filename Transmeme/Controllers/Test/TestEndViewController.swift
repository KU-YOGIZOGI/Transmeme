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
    let horizontalLine = UIImageView().then {
        $0.image = UIImage(named: "horizontalLine")
    }
    let participateButton = UIButton().then {
        $0.frame = CGRect(x: 0, y: 0, width: 191, height: 54)
        $0.backgroundColor = UIColor.white
        $0.setTitleColor(.white, for: .normal)
        $0.setTitle("닫기", for: .normal)
        $0.titleLabel?.font = UIFont(name: "GmarketSansMedium", size: 25)
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
    }
}
