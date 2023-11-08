//
//  TransViewController.swift
//  Transmeme
//
//  Created by 홍서린 on 2023/11/04.
//

import Foundation
import SnapKit
import Then
import UIKit

class TransViewController: UIViewController {
    
    let topview = UIView()
    
    let titleLogo = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.image = UIImage(named: "titlelogox1")
    }
    
    let welcomeLabel =  UILabel().then {
        $0.text = "트랜스밈에 오신걸 환영합니다!"
        $0.textColor = .white
        $0.font = UIFont(name: "GmarketSansLight", size: 19)
    }
    
    let guideLabel =  UILabel().then {
        $0.text = "트랜스밈이\n알려드릴게요!"
        $0.textColor = .white
        $0.numberOfLines = 2
        $0.font = UIFont(name: "GmarketSansBold", size: 34)

        let underlineColor = UIColor(r: 58,g: 125,b: 253)
        
        let attributedString = NSMutableAttributedString(string: $0.text!)
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.thick.rawValue, range: NSRange(location: 0, length: attributedString.length))
        attributedString.addAttribute(.underlineColor, value: underlineColor, range: NSRange(location: 0, length: attributedString.length))
        $0.attributedText = attributedString
        $0.sizeToFit()

    }
    
    let highLightLineView = UIView().then {
        $0.backgroundColor = UIColor(r: 58, g: 125, b: 253)
    }
    let highLightLineView2 = UIView().then {
        $0.backgroundColor = UIColor(r: 58, g: 125, b: 253)
    }
    
    let bearIcon = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.image = UIImage(named: "bearx1")
    }
    
    private let titleLabel =  UILabel().then {
        $0.text = "[밈 번역기]"
        $0.textColor = .black
        $0.font = UIFont(name: "GmarketSansBold", size: 25)
    }
    
    private let subTitleLabel =  UILabel().then {
        $0.text = "모르는 단어를 검색해주세요"
        $0.textColor = .black
        $0.font = UIFont(name: "GmarketSansMedium", size: 20)
    }
    
    let barImage = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.image = UIImage(named: "inFrontOfLabelx1")
    }
    
    private let searchLabel =  UILabel().then {
        $0.text = "검색"
        $0.textColor = .black
        $0.font = UIFont(name: "GmarketSansLight", size: 17)
    }
    
    private let searchTextField = InsetTextField().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
        $0.textColor = .black
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor = UIColor(r:173, g:170, b:170).cgColor
        $0.placeholder = "단어검색"
        $0.setPlaceholder(color: UIColor(r: 227, g: 227, b: 227))
        $0.textColor = UIColor(r: 0, g: 0, b: 0)
        $0.font = UIFont(name: "GmarketSansLight", size: 15)
        $0.insetX = 12
    }
    
    let lineView = UIView().then {
        $0.backgroundColor = UIColor(r: 173, g: 170, b: 170)
    }
    let lineView2 = UIView().then {
        $0.backgroundColor = UIColor(r: 173, g: 170, b: 170)
    }
    let lineView3 = UIView().then {
        $0.backgroundColor = UIColor(r: 173, g: 170, b: 170)
    }
    
    let transLogo = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.image = UIImage(named: "translogox1")
    }
    
    private let resultTextLabel = UILabel().then {
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 20
        $0.layer.borderColor = UIColor(r:173, g:170, b:170).cgColor
    }
    
    let transBtn = UIButton().then {
        $0.clipsToBounds = true
        $0.backgroundColor = UIColor(r: 0, g: 9, b: 181)
        $0.setTitle("번역하기", for: .normal)
        $0.titleLabel?.font = UIFont(name: "GmarketSansMedium", size: 11)
        $0.layer.cornerRadius = 5 // 테두리 둥글기 설정
        // $0.addTarget(TransViewController.self, action: #selector(transBtnTapped), for: .touchUpInside)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            view.endEditing(true)
        }
    
    let barImage2 = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.image = UIImage(named: "inFrontOfLabelx1")
    }
    
    private let meanLabel =  UILabel().then {
        $0.text = "해설"
        $0.textColor = .black
        $0.font = UIFont(name: "GmarketSansLight", size: 17)
    }
    
    private let meanTextLabel = BasePaddingLabel(padding: UIEdgeInsets(top: 2, left: 12, bottom: 2, right: 4)).then {
        $0.text = "단어를 검색하면 해설이 나와요!"
        $0.textColor = UIColor(r: 227, g: 227, b: 227)
        $0.font = UIFont(name: "GmarketSansLight", size: 15)
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 20
        $0.layer.borderColor = UIColor(r:173, g:170, b:170).cgColor
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }

    func setup(){

        self.view.backgroundColor = .white
        self.topview.backgroundColor = UIColor(r:0, g:9, b:181)
        view.addSubview(topview)
        topview.addSubview(titleLogo)
        topview.addSubview(welcomeLabel)
        topview.addSubview(guideLabel)
        topview.addSubview(bearIcon)
        view.addSubview(titleLabel)
        view.addSubview(subTitleLabel)
        view.addSubview(barImage)
        view.addSubview(searchLabel)
        view.addSubview(searchTextField)
        view.addSubview(lineView)
        view.addSubview(transLogo)
        view.addSubview(resultTextLabel)
        view.addSubview(lineView2)
        searchTextField.addSubview(transBtn)
        view.addSubview(barImage2)
        view.addSubview(meanLabel)
        view.addSubview(meanTextLabel)
        view.addSubview(lineView3)
        
        topview.snp.makeConstraints{
            $0.height.equalTo(300)
            $0.top.leading.trailing.equalTo(0)
        }
        
        titleLogo.snp.makeConstraints{
            $0.top.equalTo(66)
            $0.leading.equalTo(welcomeLabel.snp.leading)
            $0.width.equalTo(34)
            $0.height.equalTo(35)
        }
        
        welcomeLabel.snp.makeConstraints{
            $0.top.equalTo(128)
            $0.leading.equalTo(41)
            $0.trailing.equalTo(-72)
            $0.height.equalTo(19)
        }
        guideLabel.snp.makeConstraints{
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(33)
            $0.leading.equalTo(43)
            $0.trailing.equalTo(-140)
            $0.bottom.equalTo(-22)
        }
        
        bearIcon.snp.makeConstraints{
            $0.top.equalTo(welcomeLabel.snp.bottom).offset(20)
            $0.leading.equalTo(guideLabel.snp.trailing).offset(10)
            $0.height.equalTo(97)
            $0.width.equalTo(95)
        }
        
        titleLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(topview.snp.bottom).offset(18)
            $0.height.equalTo(25)
        }
        
        subTitleLabel.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.height.equalTo(20)
        }
        
        barImage.snp.makeConstraints{
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(20)
            $0.leading.equalTo(44)
            $0.width.equalTo(2)
            $0.height.equalTo(15)
        }
        
        searchLabel.snp.makeConstraints{
            $0.top.equalTo(barImage)
            $0.leading.equalTo(barImage.snp.trailing).offset(3)
            $0.width.equalTo(35)
            $0.height.equalTo(15)
        }
        
        searchTextField.snp.makeConstraints{
            $0.top.equalTo(searchLabel.snp.bottom).offset(10)
            $0.leading.equalTo(barImage)
            $0.trailing.equalTo(transLogo.snp.leading).offset(-10)
            $0.width.equalTo(132)
            $0.height.equalTo(107)
        }
        
        transLogo.snp.makeConstraints{
            $0.top.equalTo(subTitleLabel.snp.bottom).offset(87)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(28)
            $0.height.equalTo(19)
        }
        
        lineView.snp.makeConstraints {
            $0.leading.equalTo(searchTextField.snp.leading).offset(10)
            $0.trailing.equalTo(searchTextField.snp.trailing).offset(-10)
            $0.top.equalTo(searchTextField.snp.top).offset(25)
            $0.height.equalTo(1)
        }
        
        resultTextLabel.snp.makeConstraints{
            $0.top.equalTo(searchTextField)
            $0.leading.equalTo(transLogo.snp.trailing).offset(15)
            $0.width.equalTo(132)
            $0.height.equalTo(107)
        }
        lineView2.snp.makeConstraints {
            $0.leading.equalTo(resultTextLabel.snp.leading).offset(10)
            $0.trailing.equalTo(resultTextLabel.snp.trailing).offset(-10)
            $0.top.equalTo(resultTextLabel.snp.top).offset(25)
            $0.height.equalTo(1)
        }
        transBtn.snp.makeConstraints {
            $0.leading.equalTo(searchTextField.snp.leading).offset(40)
            $0.trailing.equalTo(searchTextField.snp.trailing).offset(-40)
            $0.bottom.equalTo(searchTextField.snp.bottom).offset(-8)
            $0.height.equalTo(18)
        }
        
        barImage2.snp.makeConstraints{
            $0.top.equalTo(searchTextField.snp.bottom).offset(20)
            $0.leading.equalTo(barImage.snp.leading)
            $0.width.equalTo(2)
            $0.height.equalTo(15)
        }
        
        meanLabel.snp.makeConstraints{
            $0.top.equalTo(barImage2)
            $0.leading.equalTo(barImage2.snp.trailing).offset(3)
            $0.width.equalTo(35)
            $0.height.equalTo(15)
        }
        
        meanTextLabel.snp.makeConstraints{
            $0.top.equalTo(meanLabel.snp.bottom).offset(10)
            $0.leading.equalTo(barImage2)
            $0.trailing.equalTo(resultTextLabel.snp.trailing)
            $0.height.equalTo(150)
        }
        
        lineView3.snp.makeConstraints {
            $0.leading.equalTo(lineView.snp.leading)
            $0.trailing.equalTo(lineView2.snp.trailing)
            $0.top.equalTo(meanTextLabel.snp.top).offset(40)
            $0.height.equalTo(1)
        }
    }
    
        @objc func transBtnTapped(){
    
    
        } //버튼 누르면 수행할거(나중에 네비게이션으로)
    
 
    
}

