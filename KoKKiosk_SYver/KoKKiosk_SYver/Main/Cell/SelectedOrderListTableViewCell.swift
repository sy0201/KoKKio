//
//  SelectedOrderListTableViewCell.swift
//  KoKKiosk_SYver
//
//  Created by siyeon park on 11/27/24.
//

import UIKit

final class SelectedOrderListTableViewCell: UITableViewCell, ReuseIdentifying {
    lazy var hStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.text = "허니콤보"
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup UI

extension SelectedOrderListTableViewCell {
    func setupUI() {
        addSubview(hStackView)
        hStackView.addArrangedSubview(titleLabel)
    }
    
    func setupConstraint() {
        hStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
