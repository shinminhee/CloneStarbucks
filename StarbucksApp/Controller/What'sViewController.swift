//
//  What'sViewController.swift
//  StarbucksApp
//
//  Created by 신민희 on 2021/05/25.
//

import UIKit

class What_sViewController: UIViewController {
    
    let eventTableView = UITableView(frame: .zero, style: .grouped)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()

    }
    
}

extension What_sViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AllEventTableViewCell.identifier, for: indexPath) as? AllEventTableViewCell else { fatalError() }
        return cell
    }
}

extension What_sViewController {
    func setUI() {
        setBasic()
        setLayout()
    }
    func setBasic() {
        eventTableView.rowHeight = 100
        eventTableView.dataSource = self
        eventTableView.register(AllEventTableViewCell.self, forCellReuseIdentifier: AllEventTableViewCell.identifier)

    }
    
    func setLayout() {
        view.addSubview(eventTableView)
        eventTableView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        
    }
    
}
