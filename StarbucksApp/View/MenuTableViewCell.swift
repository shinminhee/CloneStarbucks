//
//  MenuTableViewCell.swift
//  StarbucksApp
//
//  Created by 신민희 on 2021/05/25.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    static let identifier = "MenuTableViewCell"
    let customLabel = UILabel()
    let seeAllButton = UIButton()
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
        menuCollectionLayout.scrollDirection = .horizontal
        menuCollectionLayout.minimumInteritemSpacing = 0
        menuCollectionLayout.minimumLineSpacing = 0
        menuCollectionLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        menuCollectionLayout.itemSize = CGSize(width: 140, height: 140)

        menuCollectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: "MenuCollectionViewCell")
        menuCollectionView.dataSource = self
        menuCollectionView.backgroundColor = .white
        menuCollectionView.showsHorizontalScrollIndicator = false
    }
    func setLayout() {
        [customLabel, seeAllButton, menuCollectionView].forEach {
            contentView.addSubview($0)
        }
        customLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(40)
        }
        seeAllButton.snp.makeConstraints {
            $0.top.height.equalTo(customLabel)
            $0.trailing.equalToSuperview().inset(10)
            $0.width.equalTo(100)
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
        cell.menuLable.text = "음료이름"
        cell.menuImage.layer.cornerRadius = 50
        return cell
    }
}
