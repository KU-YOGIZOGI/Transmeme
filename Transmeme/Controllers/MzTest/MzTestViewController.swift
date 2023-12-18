//
//  MzTestViewController.swift
//  Transmeme
//
//  Created by 홍서린 on 12/15/23.
//

import Foundation
import UIKit
import Then
import SnapKit

class MzTestViewController : UIViewController {
    
    let transLogoEn = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.image = UIImage(named: "title_enx1")
    }
    
    private let titleLabel =  UILabel().then {
        $0.text = "MZ테스트"
        $0.textColor = .black
        $0.numberOfLines = 0
        $0.font = UIFont(name: "GmarketSansBold", size: 34)
        
        if let range = $0.text?.range(of: "MZ") {
            let nsRange = NSRange(range, in: $0.text!)
            $0.setTextColor(UIColor(r: 0, g: 176, b: 240), range: nsRange)
        }
    }
    
    private let nameLabel =  UILabel().then {
        $0.text = "이름(닉네임)"
        $0.textColor = .black
        $0.numberOfLines = 0
        $0.font = UIFont(name: "GmarketSansBold", size: 13)
    }
    
    private let nameTextField = InsetTextField().then {
        $0.backgroundColor = UIColor(r: 136, g: 218, b: 248)
        $0.layer.cornerRadius = 10
        $0.textColor = .black
        $0.setPlaceholder(color: UIColor(r: 227, g: 227, b: 227))
        $0.textColor = UIColor(r: 0, g: 0, b: 0)
        $0.font = UIFont(name: "GmarketSansMedium", size: 17)
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.masksToBounds = false
        $0.layer.shadowOffset = CGSize(width: 0, height: 4)
        $0.layer.shadowRadius = 5
        $0.layer.shadowOpacity = 0.15
        $0.insetX = 12
    }
    
    private let ageLabel =  UILabel().then {
        $0.text = "나이"
        $0.textColor = .black
        $0.numberOfLines = 0
        $0.font = UIFont(name: "GmarketSansBold", size: 13)
    }
    
    private let ageTextField = InsetTextField().then {
        $0.backgroundColor = UIColor(r: 136, g: 218, b: 248)
        $0.layer.cornerRadius = 10
        $0.textColor = .black
        $0.setPlaceholder(color: UIColor(r: 227, g: 227, b: 227))
        $0.textColor = UIColor(r: 0, g: 0, b: 0)
        $0.font = UIFont(name: "GmarketSansMedium", size: 17)
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.masksToBounds = false
        $0.layer.shadowOffset = CGSize(width: 0, height: 4)
        $0.layer.shadowRadius = 5
        $0.layer.shadowOpacity = 0.15
        $0.insetX = 12
    }

    let startBtn = UIButton().then {
        $0.setTitle("시작하기", for: .normal)
        $0.titleLabel?.font = UIFont(name: "GmarketSansBold", size: 17)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.masksToBounds = false
        $0.layer.shadowOffset = CGSize(width: 0, height: 4)
        $0.layer.shadowRadius = 5
        $0.layer.shadowOpacity = 0.15
        
        $0.addTarget(self, action: #selector(startBtnTapped), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        
    }
    
    func setUp() {
        
        self.view.backgroundColor = .white
        
        view.addSubview(transLogoEn)
        view.addSubview(titleLabel)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(ageLabel)
        view.addSubview(ageTextField)
        view.addSubview(startBtn)
        
        transLogoEn.snp.makeConstraints{
            $0.top.equalTo(200)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(15)
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(transLogoEn.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(160)
            $0.height.equalTo(35)
        }
        
        nameLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(50)
            $0.leading.equalTo(30)
            $0.width.equalTo(100)
            $0.height.equalTo(20)
        }
        
        nameTextField.snp.makeConstraints{
            $0.top.equalTo(nameLabel.snp.bottom).offset(5)
            $0.leading.equalTo(nameLabel)
            $0.trailing.equalTo(-30)
            $0.height.equalTo(50)
        }
        
        ageLabel.snp.makeConstraints{
            $0.top.equalTo(nameTextField.snp.bottom).offset(10)
            $0.leading.equalTo(nameLabel)
            $0.width.equalTo(100)
            $0.height.equalTo(20)
        }
        
        ageTextField.snp.makeConstraints{
            $0.top.equalTo(ageLabel.snp.bottom).offset(5)
            $0.leading.equalTo(ageLabel)
            $0.trailing.equalTo(-30)
            $0.height.equalTo(50)
        }
        
        startBtn.snp.makeConstraints{
            $0.top.equalTo(ageTextField.snp.bottom).offset(70)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(30)
        }
    }
    
    @objc func startBtnTapped(){
        
    }
    
}

