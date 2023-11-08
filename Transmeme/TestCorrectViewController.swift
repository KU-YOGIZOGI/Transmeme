//
//  TestCorrectViewController.swift
//  Transmeme
//
//  Created by 정아현 on 11/8/23.
//

import UIKit
import SnapKit
import Then

class TestCorrectViewController: UIViewController {
    let background = UIView().then { $0.backgroundColor = UIColor.black.withAlphaComponent(0.3) }
    let correctImage = UIImageView().then {
        $0.image = UIImage(named: "correct")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        
        self.view.addSubview(background)
        self.view.addSubview(correctImage)
        applyConstraintsToComponents()
    }
    
    func applyConstraintsToComponents() {
        let safeArea = view.safeAreaLayoutGuide
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(0)
        }
        correctImage.snp.makeConstraints { make in
            make.width.height.equalTo(200)
            make.centerX.centerY.equalTo(safeArea)
        }
    }
}
