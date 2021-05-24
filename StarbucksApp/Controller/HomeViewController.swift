//
//  HomeViewController.swift
//  StarbucksApp
//
//  Created by 신민희 on 2021/05/20.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    var gradientLayer: CAGradientLayer!
    let mainLabel = UILabel()
    let mainTableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}


extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let FrequencyTableViewCell = tableView.dequeueReusableCell(withIdentifier: "FrequencyTableViewCell", for: indexPath) as? FrequencyTableViewCell else { fatalError() }
        guard let MenuTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as? MenuTableViewCell else { fatalError() }
        switch indexPath {
        case [0, 0]:
            FrequencyTableViewCell.setUI()
        case [0, 1]:
            MenuTableViewCell.setUI()
//        case [0, 2]:
//            guard let EventImageTableViewCell = tableView.dequeueReusableCell(withIdentifier: "EventImageTableViewCell", for: indexPath) as? EventImageTableViewCell else { fatalError() }
//        case [0, 3]:
//            guard let EventTableViewCell = tableView.dequeueReusableCell(withIdentifier: "EventTableViewCell", for: indexPath) as? EventTableViewCell else { fatalError() }
//        case [0, 4]:
//            guard let PopularDrinksTableViewCell = tableView.dequeueReusableCell(withIdentifier: "PopularDrinksTableViewCell", for: indexPath) as? PopularDrinksTableViewCell else { fatalError() }
//        case [0, 5]:
//            guard let EventImageTableViewCell = tableView.dequeueReusableCell(withIdentifier: "EventImageTableViewCell", for: indexPath) as? EventImageTableViewCell else { fatalError() }
//        case [0, 6]:
//            guard let EventImageTableViewCell = tableView.dequeueReusableCell(withIdentifier: "EventImageTableViewCell", for: indexPath) as? EventImageTableViewCell else { fatalError() }
//        case [0, 7]:
//            guard let EventImageTableViewCell = tableView.dequeueReusableCell(withIdentifier: "EventImageTableViewCell", for: indexPath) as? EventImageTableViewCell else { fatalError() }
//        case [0, 8]:
//            guard let EventImageTableViewCell = tableView.dequeueReusableCell(withIdentifier: "EventImageTableViewCell", for: indexPath) as? EventImageTableViewCell else { fatalError() }
//        case [0, 9]:
//            guard let EventImageTableViewCell = tableView.dequeueReusableCell(withIdentifier: "EventImageTableViewCell", for: indexPath) as? EventImageTableViewCell else { fatalError() }
        default:
            break
        }
        return MenuTableViewCell
    }
}

extension HomeViewController {
    func setUI() {
        setGradientLayer()
        setLayout()
        setBasic()
        setTableView()
        
    }
    func setLayout() {
        view.addSubview(mainLabel)
        mainLabel.snp.makeConstraints {
            $0.leading.equalTo(view).inset(20)
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.height.equalTo(100)
            $0.width.equalTo(300)
        }
        view.addSubview(mainTableView)
        mainTableView.snp.makeConstraints {
            $0.top.equalTo(view).inset(300)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    func setBasic() {
        mainLabel.text = "신민희님, \n언제나 고맙습니다❤️"
        mainLabel.font = UIFont.systemFont(ofSize: 25, weight: .semibold)
        mainLabel.numberOfLines = 2
        mainLabel.textAlignment = .left
    }
    func setTableView() {
        mainTableView.dataSource = self
        mainTableView.rowHeight = 220
        mainTableView.register(FrequencyTableViewCell.self, forCellReuseIdentifier: "FrequencyTableViewCell")
        mainTableView.register(MenuTableViewCell.self, forCellReuseIdentifier: "MenuTableViewCell")
        mainTableView.register(MenuTableViewCell.self, forCellReuseIdentifier: "EventImageTableViewCell")
        mainTableView.register(MenuTableViewCell.self, forCellReuseIdentifier: "EventTableViewCell")
        mainTableView.register(MenuTableViewCell.self, forCellReuseIdentifier: "PopularDrinksTableViewCell")

    }
    func setGradientLayer() {
        self.gradientLayer = CAGradientLayer()
        self.gradientLayer .frame = self.view.bounds
        self.gradientLayer.colors = [UIColor(displayP3Red: 241/255, green: 236/255, blue: 110/255, alpha: 1).cgColor, UIColor.white.cgColor, UIColor.white.cgColor]
        self.view.layer.addSublayer(self.gradientLayer)
    }
}
