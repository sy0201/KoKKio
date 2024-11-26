//
//  HeaderCollectionReusableView.swift
//  KoKKiosk_SYver
//
//  Created by siyeon park on 11/26/24.
//

import UIKit

final class HeaderCollectionReusableView: UICollectionReusableView, ReuseIdentifying {
    private let segmentControl: UISegmentedControl = {
        let segment = UISegmentedControl()
        segment.insertSegment(withTitle: "허니", at: 0, animated: true)
        segment.insertSegment(withTitle: "레드", at: 1, animated: true)
        segment.insertSegment(withTitle: "주류", at: 2, animated: true)
        segment.selectedSegmentIndex = 0
        
        segment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white,
                                        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .regular)
                                       ], for: .normal)
        
        segment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red,
                                        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .bold)
                                       ], for: .selected)
        
        return segment
    }()
    
    var onSegmentChanged: ((Enum.MenuType) -> Void)?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraint()
        segmentControl.addTarget(self, action: #selector(didChangeValue(_:)), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup UI

extension HeaderCollectionReusableView {
    func setupUI() {
        addSubview(segmentControl)
    }
    
    func setupConstraint() {
        segmentControl.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    /// Segment 탭시 collectionView 그려주기
    /// - Parameter sender: segment Index 전달하기 위함
    @objc func didChangeValue(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            print("허니 선택됨")
            onSegmentChanged?(.honeyChicken)
        case 1:
            print("레드 선택됨")
            onSegmentChanged?(.redChicken)
        case 2:
            print("주류 선택됨")
            onSegmentChanged?(.drink)
        default:
            break
        }
    }
}
