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

