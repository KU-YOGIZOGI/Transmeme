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
    let background = UIView().then { $0.backgroundColor = UIColor.black.withAlphaComponent(0.5) }

    let popUpView = UIView().then {
        $0.backgroundColor = UIColor.white
        $0.layer.cornerRadius = 10
    }
    let endLabel = UILabel().then {
        $0.textColor = UIColor.black
        $0.font = UIFont(name: "GmarketSansMedium", size: 20)
        $0.numberOfLines = 0
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        paragraphStyle.lineSpacing = 6

        let attrString = NSMutableAttributedString(string: "테스트를 완료하였습니다!\n닫기를 누르시면\n첫번째 문제로 돌아갑니다.", attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        $0.attributedText = attrString
    }
    let horizontalLine = UIImageView().then {
        $0.image = UIImage(named: "horizontalLine")
    }
    let closeButton = UIButton().then {
        $0.frame = CGRect(x: 0, y: 0, width: 191, height: 10)
        $0.backgroundColor = UIColor.white
        $0.setTitleColor(.black, for: .normal)
        $0.setTitle("닫기", for: .normal)
        $0.titleLabel?.font = UIFont(name: "GmarketSansMedium", size: 25)
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        
        self.view.addSubview(background)
        self.view.addSubview(popUpView)
        popUpView.addSubview(endLabel)
        popUpView.addSubview(horizontalLine)
        popUpView.addSubview(closeButton)
        backgroundConstraints()
        applyConstraintsToComponents()
        
        closeButton.addTarget(self, action: #selector(didTapcloseButton), for: .touchUpInside)
    }
    
    private func backgroundConstraints() {
        background.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(0)
        }
    }
    
    func applyConstraintsToComponents() {
        let safeArea = view.safeAreaLayoutGuide
        
        popUpView.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(190)
            make.centerY.equalTo(safeArea)
            make.leading.equalTo(safeArea.snp.leading).offset(68)
            make.trailing.equalTo(safeArea.snp.trailing).offset(-68)
        }
        endLabel.snp.makeConstraints { make in
            make.top.equalTo(popUpView.snp.top).offset(40)
            make.width.equalTo(240)
            make.centerX.equalTo(popUpView)
        }
        horizontalLine.snp.makeConstraints { make in
            make.width.equalTo(257)
            make.top.equalTo(endLabel.snp.bottom).offset(20)
            make.leading.equalTo(safeArea.snp.leading).offset(68)
        }
        closeButton.snp.makeConstraints { make in
            make.centerX.equalTo(popUpView)
            make.top.equalTo(horizontalLine.snp.bottom).offset(12)
            
        }
    }
    
    @objc func didTapcloseButton() {
        let addVC = Test1ViewController()
        addVC.modalPresentationStyle = .overFullScreen
        present(addVC, animated: false, completion: nil)
    }
}
