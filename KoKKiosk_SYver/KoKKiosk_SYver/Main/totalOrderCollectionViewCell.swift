//
//  totalOrderCollectionViewCell.swift
//  KoKKiosk_SYver
//
//  Created by siyeon park on 11/27/24.
//

import UIKit

final class totalOrderCollectionViewCell: UICollectionViewCell, ReuseIdentifying {
    let containerView = UIView()
    
    let titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.spacing = 2

        return stackView
    }()
    
    let orderAmountTitle: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 12, weight: .regular)
        titleLabel.textColor = .black
        titleLabel.text = "주문금액"
        return titleLabel
    }()
    
    let deliveryTipsTitle: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 12, weight: .regular)
        titleLabel.textColor = .black
        titleLabel.text = "배달팁"
        return titleLabel
    }()
    
    let totalOrderAmountTitle: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 12, weight: .regular)
        titleLabel.textColor = .black
        titleLabel.text = "총 주문금액"
        return titleLabel
    }()
    
    let valueStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .trailing
        stackView.distribution = .fill
        stackView.spacing = 2
        return stackView
    }()
    
    /// 주문금액 데이터 Label
    var orderAmount: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 12, weight: .regular)
        titleLabel.textColor = .black
        titleLabel.text = "23,000"
        return titleLabel
    }()
    
    /// 배달팁 고정 Label
    var deliveryTips: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 12, weight: .regular)
        titleLabel.textColor = .black
        titleLabel.text = "5,000"
        return titleLabel
    }()
    
    /// 총 주문금액 데이터 Label
    var totalOrderAmount: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 14, weight: .semibold)
        titleLabel.textColor = .black
        titleLabel.text = "28,000"
        return titleLabel
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup UI

extension totalOrderCollectionViewCell {
    func setupUI() {
        containerView.backgroundColor = .white
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = CGColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1.0)
        containerView.layer.cornerRadius = 15
        
        addSubview(containerView)
        addSubview(titleStackView)
        addSubview(valueStackView)
        
        titleStackView.addArrangedSubview(orderAmountTitle)
        titleStackView.addArrangedSubview(deliveryTipsTitle)
        titleStackView.addArrangedSubview(totalOrderAmountTitle)
        
        valueStackView.addArrangedSubview(orderAmount)
        valueStackView.addArrangedSubview(deliveryTips)
        valueStackView.addArrangedSubview(totalOrderAmount)
        
    }
    
    // TODO: - 추후 여백 조정
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        titleStackView.snp.makeConstraints { make in
            make.leading.equalTo(containerView.snp.leading).offset(16)
            make.centerY.equalTo(containerView)
        }
        
        valueStackView.snp.makeConstraints { make in
            make.trailing.equalTo(containerView.snp.trailing).offset(-16)
            make.centerY.equalTo(containerView)
        }
    }
}
