//
//  ChickenMenuCollectionViewCell.swift
//  KoKKiosk_SYver
//
//  Created by siyeon park on 11/26/24.
//

import UIKit

final class ChickenMenuCollectionViewCell: UICollectionViewCell, ReuseIdentifying {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .blue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
