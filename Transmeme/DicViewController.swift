//
//  DicViewController.swift
//  Transmeme
//
//  Created by 정아현 on 11/4/23.
//

import UIKit
import SnapKit
import Then

class DicViewController: UIViewController {
    let backButton = UIButton().then{
        $0.setImage(UIImage(named: "backButton"), for: .normal)
    }
    let topLabel = UILabel().then{
        $0.text = "[세대별 도감]"
        $0.textColor = UIColor.black
        $0.numberOfLines = 0
    }
    let searchImage = UIImageView().then {
        $0.image = UIImage(named: "dicSearch")
    }
    let generationButton = UIButton().then {
        $0.setImage(UIImage(named: "dicgenButton"), for: .normal)
    }
    let grayLine = UIImageView().then {
        $0.image = UIImage(named: "dicLine")
    }
    let labelHighlight = UIImageView().then {
        $0.image = UIImage(named: "labelHighlight")
    }
    let generationLabel = UILabel().then {
        $0.text = "X세대"
        $0.textColor = UIColor.black
        $0.numberOfLines = 0
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.view.addSubview(backButton)
        self.view.addSubview(topLabel)
        self.view.addSubview(searchImage)
        self.view.addSubview(generationButton)
        applyConstraintsToTopSection()
        
        self.view.addSubview(labelHighlight)
        self.view.addSubview(generationLabel)
        self.view.addSubview(grayLine)
        applyConstraintsToMidSection()
        
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    }
    
    func applyConstraintsToTopSection() {
        let safeArea = view.safeAreaLayoutGuide
        
        backButton.snp.makeConstraints { make in
            make.width.equalTo(11)
            make.height.equalTo(20)
            make.top.equalTo(safeArea.snp.top).offset(11)
            make.leading.equalTo(safeArea.snp.leading).offset(28)
        }
        topLabel.snp.makeConstraints { make in
            make.top.equalTo(safeArea.snp.top).offset(11)
            make.leading.equalTo(backButton.snp.trailing).offset(103)
        }
        searchImage.snp.makeConstraints { make in
            make.width.equalTo(358)
            make.height.equalTo(49)
            make.top.equalTo(topLabel.snp.bottom).offset(39)
            make.leading.equalTo(safeArea.snp.leading).offset(36)
            make.trailing.equalTo(safeArea.snp.trailing).offset(-35)
        }
        generationButton.snp.makeConstraints { make in
            make.width.equalTo(12)
            make.height.equalTo(9)
            make.leading.equalTo(searchImage.snp.leading).offset(70)
            make.top.equalTo(searchImage.snp.top).offset(20)
        }
    }
    
    func applyConstraintsToMidSection() {
        let safeArea = view.safeAreaLayoutGuide
        
        labelHighlight.snp.makeConstraints { make in
            make.width.equalTo(73)
            make.height.equalTo(9)
            make.top.equalTo(searchImage.snp.bottom).offset(47)
            make.leading.equalTo(safeArea.snp.leading).offset(26)
        }
        generationLabel.snp.makeConstraints { make in
            make.width.equalTo(68)
            make.height.equalTo(25)
            make.top.equalTo(searchImage.snp.bottom).offset(28)
            make.leading.equalTo(safeArea.snp.leading).offset(29)
        }
        grayLine.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.top.equalTo(searchImage.snp.bottom).offset(65)
            make.leading.equalTo(safeArea.snp.leading).offset(26)
            make.trailing.equalTo(safeArea.snp.trailing).offset(-26)
        }
    }
    
    @objc private func backButtonTapped() {
        dismiss(animated: true) {
            }
        }
    }

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct ViewControllerPreview: PreviewProvider {
    static var previews: some View {
        DicViewController().showPreview(.iPhone14Pro)
    }
}
#endif
