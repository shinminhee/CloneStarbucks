//
//  MainTableViewCell.swift
//  StarbucksApp
//
//  Created by 신민희 on 2021/05/20.
//

import UIKit
import SnapKit

class FrequencyTableViewCell: UITableViewCell {
    
    static let identifier = "FrequencyTableViewCell"
    let frequencyBackgroundView = UIView()
    let frequencyLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUI() {
        setBasic()
        setLayout()
    }
    func setBasic() {
        frequencyBackgroundView.backgroundColor = UIColor(displayP3Red: 214/255, green: 243/255, blue: 247/255, alpha: 1)
        frequencyLabel.text = "21 Summer e-Frequency"
        frequencyLabel.font = UIFont.boldSystemFont(ofSize: 25)
    }
    func setLayout() {
        contentView.addSubview(frequencyBackgroundView)
        frequencyBackgroundView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview().inset(10)
        }
        contentView.addSubview(frequencyLabel)
        frequencyLabel.snp.makeConstraints {
            $0.leading.top.trailing.equalTo(frequencyBackgroundView).inset(20)
            $0.height.equalTo(30)
            
        }
    }
}

class MenuTableViewCell: UITableViewCell {
    
    let customLabel = UILabel()
    let menuCollectionLayout = UICollectionViewFlowLayout() //collectionviewlayout 잡기위함
    lazy var menuCollectionView = UICollectionView(frame: .zero, collectionViewLayout: menuCollectionLayout)
    let colors: [UIColor] = [UIColor.systemRed, UIColor.systemBlue, UIColor.systemPink, UIColor.systemYellow, UIColor.systemIndigo]
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUI() {
        setBasic()
        setLayout()
    }
    func setBasic() {
        customLabel.text = "신민희님을 위한 추천 메뉴"
        customLabel.font = UIFont.boldSystemFont(ofSize: 25)
        menuCollectionLayout.scrollDirection = .horizontal
        menuCollectionLayout.minimumInteritemSpacing = 0
        menuCollectionLayout.minimumLineSpacing = 0
        menuCollectionLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        menuCollectionLayout.itemSize = CGSize(width: 140, height: 140)

        menuCollectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: "MenuCollectionViewCell")
        menuCollectionView.dataSource = self
        menuCollectionView.backgroundColor = .white
    }
    func setLayout() {
        [menuCollectionView, customLabel].forEach {
            contentView.addSubview($0)
        }
        customLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(50)
        }
        menuCollectionView.snp.makeConstraints {
            $0.top.equalTo(customLabel.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}
extension MenuTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.identifier, for: indexPath) as? MenuCollectionViewCell else { fatalError() }
        cell.menuImage.backgroundColor = .systemPink
        cell.menuImage.layer.cornerRadius = 50
        cell.menuLable.text = "음료이름"
        return cell
    }
    
    
}

class EventImageTableViewCell: UITableViewCell {
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUI() {
        setBasic()
        setLayout()
    }
    func setBasic() {
        
    }
    func setLayout() {
        
    }
}

class EventTableViewCell: UITableViewCell {
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUI() {
        setBasic()
        setLayout()
    }
    func setBasic() {
        
    }
    func setLayout() {
        
    }
}

class PopularDrinksTableViewCell: UITableViewCell {
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUI() {
        setBasic()
        setLayout()
    }
    func setBasic() {
        
    }
    func setLayout() {
        
    }
}
