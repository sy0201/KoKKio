//
//  FooterCollectionReusableView.swift
//  KoKKiosk_SYver
//
//  Created by siyeon park on 11/27/24.
//

import UIKit

final class FooterCollectionReusableView: UICollectionReusableView, ReuseIdentifying {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
