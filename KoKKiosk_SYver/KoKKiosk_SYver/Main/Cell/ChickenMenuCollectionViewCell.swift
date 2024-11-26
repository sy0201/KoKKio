//
//  ChickenMenuCollectionViewCell.swift
//  KoKKiosk_SYver
//
//  Created by siyeon park on 11/26/24.
//

import UIKit

final class ChickenMenuCollectionViewCell: UICollectionViewCell, ReuseIdentifying {
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //collectionView.backgroundColor = .red
        return collectionView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraint()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateMenuTypeCollectionView(menuType: Enum.MenuType) {
        // 실 데이터를 받아와서 뷰 업데이트
        switch menuType {
        case .honeyChicken:
            collectionView.backgroundColor = .yellow
        case .redChicken:
            collectionView.backgroundColor = .red
        case .drink:
            collectionView.backgroundColor = .blue
        }
    }
}

// MARK: - Setup UI

private extension ChickenMenuCollectionViewCell {
    func setupUI() {
        //collectionView.backgroundColor = .clear
        addSubview(collectionView)
    }
    
    func setupConstraint() {
        collectionView.snp.makeConstraints { make in
            //make.leading.top.equalToSuperview().offset(20)
            //make.trailing.bottom.equalToSuperview().offset(-20)
            make.edges.equalToSuperview()
        }
    }
    
    func setupCollectionView() {
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        
        // 셀 연결
        self.collectionView.register(ChickenInfoCollectionViewCell.self, forCellWithReuseIdentifier: ChickenInfoCollectionViewCell.reuseIdentifier)
    }
}

// MARK: - CollectionView Method

extension ChickenMenuCollectionViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChickenInfoCollectionViewCell.reuseIdentifier, for: indexPath) as? ChickenInfoCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}
