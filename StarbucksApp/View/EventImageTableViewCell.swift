//
//  EventImageTableViewCell.swift
//  StarbucksApp
//
//  Created by 신민희 on 2021/05/25.
//

import UIKit

class EventImageTableViewCell: UITableViewCell {
    static let identifier = "EventImageTableViewCell"
    let largeImageView = UIImageView()
    
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
        contentView.addSubview(largeImageView)
        largeImageView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview().inset(10)
        }
    }
}
