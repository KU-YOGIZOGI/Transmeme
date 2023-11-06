//
//  DicViewController.swift
//  Transmeme
//
//  Created by 정아현 on 11/4/23.
//

import UIKit
import SnapKit
import Then

class DicViewController: UIViewController{
    var isBookmarkFilled = false
    let topLabel = UILabel().then{
        $0.text = "[세대별 도감]"
        $0.textColor = UIColor.black
        $0.numberOfLines = 0
    }
    let searchImage = UIImageView().then {
        $0.image = UIImage(named: "dicSearch")
    }
    let searchButton = UIButton().then {
        $0.setImage(UIImage(named: "search"), for: .normal)
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
        $0.text = "전체"
        $0.textColor = UIColor.black
        $0.numberOfLines = 0
    }
    let verticalLine = UIImageView().then {
        $0.image = UIImage(named: "verticalLine")
    }
    let horizontalLine = UIImageView().then {
        $0.image = UIImage(named: "horizontalLine")
    }
    let arrowButton = UIButton().then {
        $0.setImage(UIImage(named: "arrow"), for: .normal)
    }
    let bookmarkButton = UIButton().then {
        $0.setImage(UIImage(named: "bookMark"), for: .normal)
    }
    let titleLabel = UILabel().then {
        $0.text = "1. 안습"
        $0.textColor = UIColor.black
        $0.numberOfLines = 1
    }
    let meanLabel = UILabel().then {
        $0.text = ": 안타깝거나 불쌍해 눈물이 남."
        $0.textColor = UIColor.black
        $0.numberOfLines = 1
    }
    let exLabel = UILabel().then {
        $0.text = "ex. 이번 학기 학점 안습이네. 정말 안타깝다."
        $0.textColor = UIColor.black
        $0.numberOfLines = 0
    }
    let dicstackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .leading
        $0.spacing = 10
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        self.view.addSubview(topLabel)
        self.view.addSubview(searchImage)
        self.view.addSubview(searchButton)
        applyConstraintsToTopSection()
        
        self.view.addSubview(generationButton)
        self.view.addSubview(labelHighlight)
        self.view.addSubview(generationLabel)
        self.view.addSubview(arrowButton)
        self.view.addSubview(grayLine)
        self.view.addSubview(verticalLine)
        self.view.addSubview(horizontalLine)
        applyConstraintsToMidSection()
        
        setupStackView()
        arrowButton.addTarget(self, action: #selector(arrowButtonTapped), for: .touchUpInside)
        bookmarkButton.addTarget(self, action: #selector(bookmarkButtonTapped), for: .touchUpInside)

    }
    
    func applyConstraintsToTopSection() {
        let safeArea = view.safeAreaLayoutGuide
    
        topLabel.snp.makeConstraints { make in
            make.top.equalTo(safeArea.snp.top).offset(11)
            make.leading.equalTo(safeArea.snp.leading).offset(142)
        }
        searchImage.snp.makeConstraints { make in
            make.width.equalTo(358)
            make.height.equalTo(49)
            make.top.equalTo(topLabel.snp.bottom).offset(39)
            make.leading.equalTo(safeArea.snp.leading).offset(36)
            make.trailing.equalTo(safeArea.snp.trailing).offset(-35)
        }
        searchButton.snp.makeConstraints { make in
            make.width.height.equalTo(15)
            make.top.equalTo(searchImage.snp.top).offset(16)
            make.trailing.equalTo(searchImage.snp.trailing).offset(-17)
        }
    }
    
    func applyConstraintsToMidSection() {
        let safeArea = view.safeAreaLayoutGuide
        
        generationButton.snp.makeConstraints { make in
            make.width.equalTo(12)
            make.height.equalTo(9)
            make.leading.equalTo(safeArea.snp.leading).offset(85)
            make.centerY.equalTo(generationLabel)
        }
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
        arrowButton.snp.makeConstraints { make in
            make.width.equalTo(20.5)
            make.height.equalTo(17)
            make.top.equalTo(searchImage.snp.bottom).offset(32)
            make.trailing.equalTo(safeArea.snp.trailing).offset(-27.5)
        }
        grayLine.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.top.equalTo(searchImage.snp.bottom).offset(65)
            make.leading.equalTo(safeArea.snp.leading).offset(26)
            make.trailing.equalTo(safeArea.snp.trailing).offset(-26)
        }
        verticalLine.snp.makeConstraints { make in
            make.width.equalTo(1)
            make.height.equalTo(499)
            make.top.equalTo(grayLine.snp.bottom).offset(15)
            make.leading.equalTo(safeArea.snp.leading).offset(84)
        }
        horizontalLine.snp.makeConstraints { make in
            make.width.equalTo(343)
            make.height.equalTo(1)
            make.top.equalTo(grayLine.snp.bottom).offset(40)
            make.leading.equalTo(safeArea.snp.leading).offset(43)
            make.trailing.equalTo(safeArea.snp.trailing).offset(-43)
        }
    }
    
    func setupStackView() {
        let safeArea = view.safeAreaLayoutGuide

        let verticalStackView = UIStackView().then {
            $0.axis = .vertical
            $0.distribution = .fill
            $0.alignment = .leading
            $0.spacing = 6
        }
        
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(meanLabel)
        verticalStackView.addArrangedSubview(exLabel)
        
        let mainStackView = UIStackView().then {
            $0.axis = .horizontal
            $0.distribution = .fill
            $0.alignment = .top
            $0.spacing = 10
        }
        
        mainStackView.addArrangedSubview(bookmarkButton)
        mainStackView.addArrangedSubview(verticalStackView)

        self.view.addSubview(mainStackView)
        
        mainStackView.snp.makeConstraints { make in
            make.top.equalTo(horizontalLine.snp.bottom).offset(10)
            make.leading.equalTo(safeArea.snp.leading).offset(45)
            make.trailing.equalTo(safeArea.snp.trailing).offset(-45)
        }
        bookmarkButton.snp.makeConstraints { make in
            make.width.equalTo(16)
            make.height.equalTo(20)
        }
        verticalStackView.snp.makeConstraints { make in
            make.leading.equalTo(safeArea.snp.leading).offset(100)
        }
    }

    
    func loadDicData() {

    }

    
    @objc private func arrowButtonTapped() {
        dismiss(animated: true) {
        }
    }
    
    @objc private func bookmarkButtonTapped() {
        isBookmarkFilled.toggle()
        let imageName = isBookmarkFilled ? "fillbookMark" : "bookMark"
        bookmarkButton.setImage(UIImage(named: imageName), for: .normal)
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
