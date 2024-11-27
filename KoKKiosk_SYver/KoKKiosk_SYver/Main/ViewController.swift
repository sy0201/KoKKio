//
//  ViewController.swift
//  KoKKiosk_SYver
//
//  Created by siyeon park on 11/26/24.
//

import UIKit

final class ViewController: UIViewController {
    let mainView = MainView()
    var currentMenuType: Enum.MenuType = .honeyChicken
    
    
    override func loadView() {
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
        
        // 헤더뷰 연결
        mainView.collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.reuseIdentifier)
        
        // 셀 연결
        mainView.collectionView.register(ChickenMenuCollectionViewCell.self, forCellWithReuseIdentifier: ChickenMenuCollectionViewCell.reuseIdentifier)
        mainView.collectionView.register(ShoppingBasketCollectionViewCell.self, forCellWithReuseIdentifier: ShoppingBasketCollectionViewCell.reuseIdentifier)
    }
}

// MARK: - CollectionView Method

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCollectionReusableView.reuseIdentifier, for: indexPath) as? HeaderCollectionReusableView else {
            return UICollectionReusableView()
        }
        // ChickenMenuCollectionViewCell menuType 전달받은 후 뷰 업데이트
        header.onSegmentChanged = { [weak self] menuType in
            self?.currentMenuType = menuType
            self?.mainView.collectionView.reloadData()
        }
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.bounds.width, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChickenMenuCollectionViewCell.reuseIdentifier, for: indexPath) as? ChickenMenuCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            cell.updateMenuTypeCollectionView(menuType: currentMenuType)
            
            return cell
            
        case 1:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShoppingBasketCollectionViewCell.reuseIdentifier, for: indexPath) as? ShoppingBasketCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.row {
        case 0:
            return CGSize(width: UIScreen.main.bounds.width, height: 200)
        case 1:
            return CGSize(width: UIScreen.main.bounds.width, height: 200)
        default:
            return CGSize(width: UIScreen.main.bounds.width, height: 100)
        }
    }
}
