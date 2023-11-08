//
//  DicViewController.swift
//  Transmeme
//
//  Created by 정아현 on 11/4/23.
//

import UIKit
import SnapKit
import Then


struct WordEntry {
    let title: String
    let meaning: String
    let example: String
}
class DicViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var isBookmarkFilled = false
    let dropdownTableView = UITableView()
    let dropdownOptions = ["전체", "X세대", "MZ세대"]
    let topLabel = UILabel().then{
        $0.text = "[세대별 도감]"
        $0.textColor = UIColor.black
        $0.font = UIFont(name: "GmarketSansMedium", size: 25)
        $0.numberOfLines = 0
    }
    let searchImage = UIImageView().then {
        $0.image = UIImage(named: "dicSearch")
    }
    let searchButton = UIButton().then {
        $0.setImage(UIImage(named: "search"), for: .normal)
    }
    let searchTextField = UITextField().then {
        $0.borderStyle = .none
        $0.placeholder = "검색"
        $0.returnKeyType = .search
        $0.clearButtonMode = .whileEditing
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
        $0.font = UIFont(name: "GmarketSansMedium", size: 25)
        $0.numberOfLines = 0
        $0.adjustsFontSizeToFitWidth = true
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
    let scrollView = UIScrollView()
    let bookmarkButton = UIButton().then {
        $0.setImage(UIImage(named: "bookMark"), for: .normal)
    }
    let titleLabel = UILabel().then {
        $0.text = "1. 안습"
        $0.textColor = UIColor.black
        $0.font = UIFont(name: "GmarketSansMedium", size: 15)
        $0.numberOfLines = 1
    }
    let meanLabel = UILabel().then {
        $0.text = ": 안타깝거나 불쌍해 눈물이 남."
        $0.textColor = UIColor.black
        $0.font = UIFont(name: "GmarketSansMedium", size: 15)
        $0.numberOfLines = 1
    }
    let exLabel = UILabel().then {
        $0.text = "ex. 이번 학기 학점 안습이네. 정말 안타깝다."
        $0.textColor = UIColor.gray
        $0.font = UIFont(name: "GmarketSansMedium", size: 14)
        $0.numberOfLines = 0
    }
    let dicstackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fill
        $0.alignment = .leading
        $0.spacing = 10
    }
    var wordEntries: [WordEntry] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        loadDicData()
        self.view.addSubview(topLabel)
        self.view.addSubview(searchImage)
        self.view.addSubview(searchButton)
        self.view.addSubview(searchTextField)
        applyConstraintsToTopSection()
        
        self.view.addSubview(generationButton)
        self.view.addSubview(labelHighlight)
        self.view.addSubview(generationLabel)
        self.view.addSubview(arrowButton)
        self.view.addSubview(grayLine)
        self.view.addSubview(verticalLine)
        self.view.addSubview(horizontalLine)
        applyConstraintsToMidSection()
    
        setupScrollViewAndStackViews()
        arrowButton.addTarget(self, action: #selector(arrowButtonTapped), for: .touchUpInside)
        bookmarkButton.addTarget(self, action: #selector(bookmarkButtonTapped), for: .touchUpInside)
        setupDropdownTableView()
        generationButton.addTarget(self, action: #selector(toggleDropdown), for: .touchUpInside)
    }
    
    // constraints
    func applyConstraintsToTopSection() {
        let safeArea = view.safeAreaLayoutGuide
    
        topLabel.snp.makeConstraints { make in
            make.top.equalTo(safeArea.snp.top).offset(11)
            make.centerX.equalTo(safeArea)
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
        searchTextField.snp.makeConstraints { make in
            make.centerY.equalTo(searchImage)
            make.leading.equalTo(searchImage.snp.leading).offset(20)
        }
    }

    func applyConstraintsToMidSection() {
        let safeArea = view.safeAreaLayoutGuide
        
        generationButton.snp.makeConstraints { make in
            make.width.equalTo(12)
            make.height.equalTo(9)
            make.leading.equalTo(safeArea.snp.leading).offset(104)
            make.centerY.equalTo(generationLabel)
        }
        labelHighlight.snp.makeConstraints { make in
            make.width.equalTo(95)
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
            make.top.equalTo(grayLine.snp.bottom).offset(15)
            make.leading.equalTo(safeArea.snp.leading).offset(84)
            make.bottom.equalTo(safeArea)
        }
        horizontalLine.snp.makeConstraints { make in
            make.width.equalTo(343)
            make.height.equalTo(1)
            make.top.equalTo(grayLine.snp.bottom).offset(40)
            make.leading.equalTo(safeArea.snp.leading).offset(43)
            make.trailing.equalTo(safeArea.snp.trailing).offset(-43)
        }
    }
    
    // filter dropdown
    func setupDropdownTableView() {
        dropdownTableView.isHidden = true
        dropdownTableView.delegate = self
        dropdownTableView.dataSource = self
        self.view.addSubview(dropdownTableView)

        dropdownTableView.snp.makeConstraints { make in
            make.top.equalTo(generationLabel.snp.bottom).offset(5)
            make.leading.equalTo(labelHighlight.snp.leading)
            make.width.equalTo(140)
            make.height.equalTo(140)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return dropdownOptions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "dropdownCell") ?? UITableViewCell(style: .default, reuseIdentifier: "dropdownCell")
        cell.textLabel?.text = dropdownOptions[indexPath.row]
        cell.textLabel?.adjustsFontSizeToFitWidth = true
    
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        generationLabel.text = dropdownOptions[indexPath.row]
        toggleDropdown()
    }

    @objc func toggleDropdown() {
        UIView.animate(withDuration: 0.3) {
            self.dropdownTableView.isHidden = !self.dropdownTableView.isHidden
            self.view.layoutIfNeeded()
        }
    }
   
    // dic stackview
    func createHorizontalStackView(with wordEntry: WordEntry) -> UIStackView {
        let titleLabel = UILabel().then {
            $0.text = "1. 안습"
            $0.textColor = UIColor.black
            $0.font = UIFont(name: "GmarketSansMedium", size: 15)
            $0.numberOfLines = 1
        }
        let meanLabel = UILabel().then {
            $0.text = ": 안타깝거나 불쌍해 눈물이 남."
            $0.textColor = UIColor.black
            $0.font = UIFont(name: "GmarketSansMedium", size: 15)
            $0.numberOfLines = 1
        }
        let exLabel = UILabel().then {
            $0.text = "ex. 이번 학기 학점 안습이네. 정말 안타깝다."
            $0.font = UIFont(name: "GmarketSansMedium", size: 14)
            $0.textColor = UIColor.gray
            $0.numberOfLines = 0
        }
        let bookmarkButton = UIButton().then {
            $0.setImage(UIImage(named: "bookMark"), for: .normal)
        }
        let verticalStackView = UIStackView(arrangedSubviews: [titleLabel, meanLabel, exLabel]).then {
            $0.axis = .vertical
            $0.spacing = 6
            $0.alignment = .leading
            $0.distribution = .equalSpacing
        }
        let horizontalStackView = UIStackView(arrangedSubviews: [bookmarkButton, verticalStackView]).then {
            $0.axis = .horizontal
            $0.spacing = 28
            $0.alignment = .top
            $0.distribution = .fill
        }
        titleLabel.text = wordEntry.title
        meanLabel.text = wordEntry.meaning
        exLabel.text = wordEntry.example
        bookmarkButton.snp.makeConstraints { make in
            make.width.equalTo(16)
            make.height.equalTo(20)
            make.leading.equalTo(horizontalStackView.snp.leading).offset(15)
        }
        verticalStackView.snp.makeConstraints { make in
            make.leading.equalTo(bookmarkButton.snp.trailing).offset(28)
            make.top.equalTo(bookmarkButton.snp.top)
        }
        return horizontalStackView
    }
    
    // dic scrollview
    func setupScrollViewAndStackViews() {
        let safeArea = view.safeAreaLayoutGuide
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = true
        self.view.addSubview(scrollView)

        scrollView.snp.makeConstraints { make in
            make.top.equalTo(horizontalLine.snp.bottom).offset(10)
            make.leading.equalTo(safeArea.snp.leading).offset(40)
            make.trailing.equalTo(safeArea.snp.trailing).offset(-45)
            make.bottom.equalTo(safeArea)
        }

        scrollView.addSubview(dicstackView)
        dicstackView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(scrollView)
            make.bottom.equalTo(scrollView.snp.bottom)
            make.width.equalTo(scrollView)
        }
        
        for wordEntry in wordEntries {
            let stackView = createHorizontalStackView(with: wordEntry)
            dicstackView.addArrangedSubview(stackView)
            
            stackView.snp.makeConstraints { make in
                make.leading.trailing.equalTo(dicstackView)
            }
        }
        
        
        if let lastStackView = dicstackView.arrangedSubviews.last {
            lastStackView.snp.makeConstraints { make in
                make.bottom.equalTo(dicstackView.snp.bottom)
            }
        }
    }

    func loadDicData() {
        wordEntries = [
            WordEntry(title: "1. 안습 [X세대]", meaning: ": 안타깝거나 불쌍해 눈물이 남.", example: "ex. 이번 학기 학점 안습이네. 정말 안타깝다."),
            WordEntry(title: "2. 농협은행 [MZ세대]", meaning: ": 너무 예쁘다.", example: "ex. A(외국인): 넘흐입흐네여~ \nB : 감사합니다 ㅎㅎ \nA(외국인): 넘흐!(농협)입흐네여(은행)!"),
            WordEntry(title: "3. H워얼V [MZ세대]", meaning: ": 사랑해.", example: "ex. 널 너무 H워얼V해. 너와 함께 시간을 보내는 게 너무 행복해."),
            WordEntry(title: "4. 킹받드라슈 [MZ세대]", meaning: ": 열받는다.", example: "ex. 하 나 숙제 안해와서 엄청 혼났어. 개킹받드라슈."),
            WordEntry(title: "5. kg받네 [MZ세대]", meaning: ": 열받는다.", example: "ex. 아 진짜 얘 깝죽거리는 것 좀 봐. kg받네."),
            WordEntry(title: "6. 점메추/저메추 [MZ세대]", meaning: ": 점심메뉴추천/저녁메뉴추천", example: "ex. 점심은 뭐 먹을까? 점메추 좀 해줄래?"),
            WordEntry(title: "7. 웃안웃 [MZ세대]", meaning: ": 웃긴데 안 웃긴다.", example: "ex. 그 영화, 웃안웃한 장면도 많아서 웃으면서 봤어."),
            WordEntry(title: "8. 갓생 [MZ세대]", meaning: ": 부지런하여 타인에게 귀감이 되는 삶", example: "ex. 와 저 선배 진짜 갓생산다."),
            WordEntry(title: "9. 갓생 [MZ세대]", meaning: ": 부지런하여 타인에게 귀감이 되는 삶", example: "ex. 와 저 선배 진짜 갓생산다."),
            WordEntry(title: "10. 갓생 [MZ세대]", meaning: ": 부지런하여 타인에게 귀감이 되는 삶", example: "ex. 와 저 선배 진짜 갓생산다."),
            WordEntry(title: "11. 갓생 [MZ세대]", meaning: ": 부지런하여 타인에게 귀감이 되는 삶", example: "ex. 와 저 선배 진짜 갓생산다."),
            WordEntry(title: "12. 갓생 [MZ세대]", meaning: ": 부지런하여 타인에게 귀감이 되는 삶", example: "ex. 와 저 선배 진짜 갓생산다."),
            WordEntry(title: "13. 갓생 [MZ세대]", meaning: ": 부지런하여 타인에게 귀감이 되는 삶", example: "ex. 와 저 선배 진짜 갓생산다."),
            WordEntry(title: "14. 갓생 [MZ세대]", meaning: ": 부지런하여 타인에게 귀감이 되는 삶", example: "ex. 와 저 선배 진짜 갓생산다."),
            WordEntry(title: "15. 갓생 [MZ세대]", meaning: ": 부지런하여 타인에게 귀감이 되는 삶", example: "ex. 와 저 선배 진짜 갓생산다."),
            WordEntry(title: "16. 갓생 [MZ세대]", meaning: ": 부지런하여 타인에게 귀감이 되는 삶", example: "ex. 와 저 선배 진짜 갓생산다."),
            WordEntry(title: "17. 갓생 [MZ세대]", meaning: ": 부지런하여 타인에게 귀감이 되는 삶", example: "ex. 와 저 선배 진짜 갓생산다."),
            WordEntry(title: "18. 갓생 [MZ세대]", meaning: ": 부지런하여 타인에게 귀감이 되는 삶", example: "ex. 와 저 선배 진짜 갓생산다.")
        ]
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

