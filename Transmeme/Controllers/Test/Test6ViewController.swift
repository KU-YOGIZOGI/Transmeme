//
//  Test6ViewController.swift
//  Transmeme
//
//  Created by 정아현 on 11/13/23.
//

import UIKit
import SnapKit
import Then

class Test6ViewController: UIViewController {
    let quizView = UIImageView().then {
        $0.image = UIImage(named: "quiz")
    }
    let quiznumLabel = UILabel().then {
        let fullString = NSMutableAttributedString(string: "Q.6", attributes: [
            .font: UIFont(name: "GmarketSansMedium", size: 25)!,
            .foregroundColor: UIColor(red: 222/255.0, green: 222/255.0, blue: 222/255.0, alpha: 1.0)
        ])

        let grayAttribute: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: "GmarketSansMedium", size: 18) ?? UIFont.systemFont(ofSize: 18),
            .foregroundColor: UIColor(red: 173/255.0, green: 170/255.0, blue: 170/255.0, alpha: 1.0)
        ]
        let grayString = NSMutableAttributedString(string: "/10", attributes: grayAttribute)
        fullString.append(grayString)
        $0.attributedText = fullString
        $0.numberOfLines = 0
    }
    let progressBar = UIProgressView().then {
        $0.trackTintColor = UIColor.lightGray
        $0.progressTintColor = UIColor(red: 74/255.0, green: 178/255.0, blue: 255/255.0, alpha: 1.0)
        $0.progress = 0.6
        $0.layer.cornerRadius = 5
        $0.clipsToBounds = true
        $0.transform = $0.transform.scaledBy(x: 1, y: 2)
    }

    let questionLabel = UILabel().then {
        $0.textColor = UIColor.white
        $0.textAlignment = .center
        $0.font = UIFont(name: "GmarketSansMedium", size: 28)
        $0.numberOfLines = 2
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.lineSpacing = 6

        let attrString = NSMutableAttributedString(string: "다음 중 '애빼시'의 뜻은\n무엇일까요?", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        $0.attributedText = attrString
    }
    let quizButton = UIButton().then {
        $0.setImage(UIImage(named: "quizButton"), for: .normal)
    }
    let quizLabel = UILabel().then {
        $0.text = "애교 빼면 시체"
        $0.textColor = UIColor.black
        $0.font = UIFont(name: "GmarketSansMedium", size: 18)
        $0.numberOfLines = 0
    }
    let quizselect = UIImageView().then {
        $0.image = UIImage(named: "quizcircle")
    }
    let quizButton2 = UIButton().then {
        $0.setImage(UIImage(named: "quizButton"), for: .normal)
    }
    let quizLabel2 = UILabel().then {
        $0.text = "애를 빼시오"
        $0.textColor = UIColor.black
        $0.font = UIFont(name: "GmarketSansMedium", size: 18)
        $0.numberOfLines = 0
    }
    let quizselect2 = UIImageView().then {
        $0.image = UIImage(named: "quizcircle")
    }
    let hintView = UIImageView().then {
        $0.image = UIImage(named: "hint")
    }
    let hintalarm = UIImageView().then {
        $0.image = UIImage(named: "alarm")
    }
    let hintLabel = UILabel().then {
        $0.text = "힌트"
        $0.textColor = UIColor.black
        $0.font = UIFont(name: "GmarketSansMedium", size: 15)
        $0.numberOfLines = 0
    }
    let hintLabel2 = UILabel().then {
        $0.textColor = UIColor.black
        $0.font = UIFont(name: "GmarketSansLight", size: 15)
        $0.numberOfLines = 2
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.lineSpacing = 4

        let attrString = NSMutableAttributedString(string: "ex. 너는 애빼시야. 진짜 귀여워.", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        $0.attributedText = attrString
    }
    let nextButton = UIButton().then {
        $0.setTitle("다음 >", for: .normal)
        $0.titleLabel?.font = UIFont(name: "GmarketSansMedium", size: 20)
        $0.setTitleColor(UIColor.white, for: .normal)
   
    }
    let correctImageView = UIImageView().then {
        $0.image = UIImage(named: "correct")
        $0.alpha = 0
    }
    let incorrectImageView = UIImageView().then {
        $0.image = UIImage(named: "incorrect")
        $0.alpha = 0
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
    
        self.view.addSubview(quizView)
        self.view.addSubview(quiznumLabel)
        self.view.addSubview(progressBar)
        self.view.addSubview(questionLabel)
        self.view.addSubview(quizButton)
        self.view.addSubview(quizLabel)
        self.view.addSubview(quizselect)
        self.view.addSubview(quizButton2)
        self.view.addSubview(quizLabel2)
        self.view.addSubview(quizselect2)
        applyConstraintsToMidSection()
        
        self.view.addSubview(hintView)
        self.view.addSubview(hintalarm)
        self.view.addSubview(hintLabel)
        self.view.addSubview(hintLabel2)
        self.view.addSubview(nextButton)
        applyConstraintsToBottomSection()
        
        quizButton.addTarget(self, action: #selector(didTapquizButton), for: .touchUpInside)
        quizButton2.addTarget(self, action: #selector(didTapquizButton2), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(didTapnextButton), for: .touchUpInside)
    }
    
    func applyConstraintsToMidSection() {
        let safeArea = view.safeAreaLayoutGuide
        
        quizView.snp.makeConstraints { make in
            make.width.equalTo(350)
            make.height.equalTo(500)
            make.top.equalTo(safeArea.snp.top).offset(194)
            make.centerX.equalTo(safeArea)
        }
        quiznumLabel.snp.makeConstraints { make in
            make.height.equalTo(23)
            make.top.equalTo(quizView.snp.top).offset(29)
            make.leading.equalTo(quizView.snp.leading).offset(33)
        }
        progressBar.snp.makeConstraints { make in
            make.width.equalTo(283)
            make.height.equalTo(4)
            make.top.equalTo(quiznumLabel.snp.bottom).offset(17.4)
            make.leading.equalTo(quizView.snp.leading).offset(33)
        }
        questionLabel.snp.makeConstraints { make in
            make.height.equalTo(62)
            make.top.equalTo(quiznumLabel.snp.bottom).offset(53)
            make.leading.equalTo(quiznumLabel)
        }
        quizButton.snp.makeConstraints { make in
            make.width.equalTo(289)
            make.height.equalTo(44)
            make.top.equalTo(questionLabel.snp.bottom).offset(40.6)
            make.centerX.equalTo(quizView)
        }
        quizLabel.snp.makeConstraints { make in
            make.top.equalTo(quizButton.snp.top).offset(13)
            make.leading.equalTo(quizButton.snp.leading).offset(16.5)
        }
        quizselect.snp.makeConstraints { make in
            make.width.height.equalTo(19)
            make.top.equalTo(quizLabel)
            make.trailing.equalTo(quizButton.snp.trailing).offset(-13)
        }
        quizButton2.snp.makeConstraints { make in
            make.width.equalTo(289)
            make.height.equalTo(44)
            make.top.equalTo(quizButton.snp.bottom).offset(11)
            make.centerX.equalTo(quizView)
        }
        quizLabel2.snp.makeConstraints { make in
            make.top.equalTo(quizButton2.snp.top).offset(13)
            make.leading.equalTo(quizButton2.snp.leading).offset(16.5)
        }
        quizselect2.snp.makeConstraints { make in
            make.width.height.equalTo(19)
            make.top.equalTo(quizLabel2)
            make.trailing.equalTo(quizButton2.snp.trailing).offset(-13)
        }
    }
    
    func applyConstraintsToBottomSection() {
        hintView.snp.makeConstraints { make in
            make.width.equalTo(quizButton)
            make.height.equalTo(91)
            make.top.equalTo(quizButton2.snp.bottom).offset(29)
            make.centerX.equalTo(quizView)
            
        }
        hintalarm.snp.makeConstraints { make in
            make.width.height.equalTo(16)
            make.top.equalTo(hintView.snp.top).offset(11)
            make.leading.equalTo(hintView.snp.leading).offset(15.5)
        }
        hintLabel.snp.makeConstraints { make in
            make.top.equalTo(hintView.snp.top).offset(12)
            make.leading.equalTo(hintView.snp.leading).offset(33.5)
        }
        hintLabel2.snp.makeConstraints { make in
            make.top.equalTo(hintView.snp.top).offset(38)
            make.centerX.equalTo(hintView)
        }
        nextButton.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.height.equalTo(22)
            make.trailing.equalTo(quizView.snp.trailing).offset(-34)
            make.leading.equalTo(quizView.snp.leading).offset(264)
            make.top.equalTo(hintView.snp.bottom).offset(20)
        }
    }
    @objc func didTapquizButton(_ sender: Any) {
        let addVC = TestCorrectViewController()
        addVC.modalPresentationStyle = .overFullScreen
        present(addVC, animated: false) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                addVC.dismiss(animated: false, completion: nil)
            }
        }
    }
    @objc func didTapquizButton2(_ sender: Any) {
        let addVC = TestIncorrectViewController()
        addVC.modalPresentationStyle = .overFullScreen
        present(addVC, animated: false) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                addVC.dismiss(animated: false, completion: nil)
            }
        }
    }
    @objc func didTapnextButton(_ sender: Any) {
        let addVC = Test7ViewController()
        addVC.modalPresentationStyle = .overFullScreen
        present(addVC, animated: true)
    }
}



