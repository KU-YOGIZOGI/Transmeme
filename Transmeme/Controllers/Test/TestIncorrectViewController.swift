//
//  TestIncorrectViewController.swift
//  Transmeme
//
//  Created by 정아현 on 11/8/23.
//

import UIKit
import SnapKit
import Then

class TestIncorrectViewController: UIViewController {
    let background = UIView().then { $0.backgroundColor = UIColor.black.withAlphaComponent(0.3) }
    let incorrectImage = UIImageView().then {
        $0.image = UIImage(named: "incorrect")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        
        self.view.addSubview(background)
        self.view.addSubview(incorrectImage)
        applyConstraintsToComponents()
    }
    
    func applyConstraintsToComponents() {
        let safeArea = view.safeAreaLayoutGuide
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(0)
        }
        incorrectImage.snp.makeConstraints { make in
            make.width.height.equalTo(200)
            make.centerX.centerY.equalTo(safeArea)
        }
    }
}
