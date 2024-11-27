//
//  ShoppingBasketCollectionViewCell.swift
//  KoKKiosk_SYver
//
//  Created by siyeon park on 11/27/24.
//

import UIKit

final class ShoppingBasketCollectionViewCell: UICollectionViewCell, ReuseIdentifying {
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraint()
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup UI

private extension ShoppingBasketCollectionViewCell {
    func setupUI() {
        addSubview(tableView)
    }
    
    func setupConstraint() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.backgroundColor = .clear
        
        // 헤더 연결

        // 셀 연결
        tableView.register(SelectedOrderListTableViewCell.self, forCellReuseIdentifier: SelectedOrderListTableViewCell.reuseIdentifier)
    }
}

// MARK: - TableView Method

extension ShoppingBasketCollectionViewCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SelectedOrderListTableViewCell.reuseIdentifier, for: indexPath) as? SelectedOrderListTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
