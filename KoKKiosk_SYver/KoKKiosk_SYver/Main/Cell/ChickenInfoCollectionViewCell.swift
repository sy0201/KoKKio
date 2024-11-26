//
//  ChickenInfoCollectionViewCell.swift
//  KoKKiosk_SYver
//
//  Created by siyeon park on 11/26/24.
//

import UIKit

final class ChickenInfoCollectionViewCell: UICollectionViewCell,ReuseIdentifying {
    let chickenLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.text = "허니콤보"
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup UI

extension ChickenInfoCollectionViewCell {
    func setupUI() {
        self.backgroundColor = .systemPink
        addSubview(chickenLabel)
    }
    
    func setupConstraint() {
        chickenLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
}
