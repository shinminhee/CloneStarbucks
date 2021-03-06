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
    let mainTableView = UITableView(frame: .zero, style: .grouped)
    let whatButton = UIButton()
    let couponButton = UIButton()
    let alarmButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
}

extension HomeViewController {
    @objc
    func tapedSeeAll(_ sender: UIButton) {
        let whatVC = What_sViewController()
        navigationController?.pushViewController(whatVC, animated: true)
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath {
        case [0, 0]:
            guard let frequencyTableViewCell = tableView.dequeueReusableCell(withIdentifier: FrequencyTableViewCell.identifier, for: indexPath) as? FrequencyTableViewCell else { fatalError() }
            //너는 지금 정확히 모를거야 너는 FrequencyTableViewCell 야 너 원래 uitableviewcell이잖아
            frequencyTableViewCell.frequencyBackgroundView.backgroundColor = UIColor(displayP3Red: 214/255, green: 243/255, blue: 247/255, alpha: 1)
            frequencyTableViewCell.frequencyLabel.text = "21 Summer e-Frequency"
            frequencyTableViewCell.frequencyLabel.font = UIFont.boldSystemFont(ofSize: 25)
            return frequencyTableViewCell
        case [0, 1]:
            guard let menuTableViewCell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.identifier, for: indexPath) as? MenuTableViewCell else { fatalError() }
            menuTableViewCell.customLabel.text = "신민희님을 위한 추천 메뉴"
            menuTableViewCell.customLabel.font = UIFont.boldSystemFont(ofSize: 25)
            return menuTableViewCell
        case [0, 2]:
            guard let eventImageTableViewCell = tableView.dequeueReusableCell(withIdentifier: EventImageTableViewCell.identifier, for: indexPath) as? EventImageTableViewCell else { fatalError() }
            eventImageTableViewCell.largeImageView.backgroundColor = .systemPink
            return eventImageTableViewCell
        case [0, 3]:
            guard let menuTableViewCell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.identifier, for: indexPath) as? MenuTableViewCell else { fatalError() }
            
            menuTableViewCell.customLabel.text = "Events"
            menuTableViewCell.customLabel.font = UIFont.boldSystemFont(ofSize: 25)
            menuTableViewCell.seeAllButton.setTitle("See all", for: .normal)
            menuTableViewCell.seeAllButton.setTitleColor(.green, for: .normal)
            menuTableViewCell.seeAllButton.addTarget(self, action: #selector(tapedSeeAll(_:)), for: .touchUpInside)
            menuTableViewCell.menuCollectionLayout.itemSize = CGSize(width: 160, height: 140)
            return menuTableViewCell
        case [0, 4]:
            guard let menuTableViewCell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.identifier, for: indexPath) as? MenuTableViewCell else { fatalError() }
            menuTableViewCell.customLabel.text = "이 시간대 인기 메뉴"
            menuTableViewCell.customLabel.font = UIFont.boldSystemFont(ofSize: 25)
            menuTableViewCell.menuCollectionLayout.itemSize = CGSize(width: 140, height: 140)

            return menuTableViewCell
        case [0, 5], [0, 6], [0, 7], [0, 8], [0, 9]:
            guard let eventImageTableViewCell = tableView.dequeueReusableCell(withIdentifier: EventImageTableViewCell.identifier, for: indexPath) as? EventImageTableViewCell else { fatalError() }
            eventImageTableViewCell.largeImageView.backgroundColor = .systemPink
            return eventImageTableViewCell
        default:
            return UITableViewCell()
        }
    }
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        let frame: CGRect = tableView.frame

        let DoneBut: UIButton = UIButton(frame: CGRect(x: frame.size.width - 200, y: 0, width: 150, height: 50)) //

        DoneBut.setTitle("Done", for: .normal)
        DoneBut.backgroundColor = UIColor.red

        DoneBut.addTarget(self, action: #selector(tapedSeeAll(_:)), for: .touchUpInside)

        DoneBut.backgroundColor = UIColor.blue

        let headerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        headerView.backgroundColor = UIColor.red
        headerView.addSubview(DoneBut)
        return headerView
    }

    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }

    func buttonTapped(sender: UIButton) {
        //Button Tapped and open your another ViewController

    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
      return "What's New"
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
        mainTableView.rowHeight = 230
        
        mainTableView.register(FrequencyTableViewCell.self, forCellReuseIdentifier: FrequencyTableViewCell.identifier)
        mainTableView.register(MenuTableViewCell.self, forCellReuseIdentifier: MenuTableViewCell.identifier)
        mainTableView.register(EventImageTableViewCell.self, forCellReuseIdentifier: EventImageTableViewCell.identifier)
        mainTableView.register(EventTableViewCell.self, forCellReuseIdentifier: EventTableViewCell.identifier)
        mainTableView.register(PopularDrinksTableViewCell.self, forCellReuseIdentifier: PopularDrinksTableViewCell.identifier)

    }
    func setGradientLayer() {
        self.gradientLayer = CAGradientLayer()
        self.gradientLayer .frame = self.view.bounds
        self.gradientLayer.colors = [UIColor(displayP3Red: 241/255, green: 236/255, blue: 110/255, alpha: 1).cgColor, UIColor.white.cgColor, UIColor.white.cgColor]
        self.view.layer.addSublayer(self.gradientLayer)
    }
}
