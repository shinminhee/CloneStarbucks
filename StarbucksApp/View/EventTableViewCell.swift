//
//  EventTableViewCell.swift
//  StarbucksApp
//
//  Created by 신민희 on 2021/05/25.
//

import UIKit

class EventTableViewCell: UITableViewCell {
     static let identifier = "EventTableViewCell"
    
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
