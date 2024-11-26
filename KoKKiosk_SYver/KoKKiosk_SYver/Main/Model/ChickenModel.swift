//
//  ChickenModel.swift
//  KoKKiosk_SYver
//
//  Created by siyeon park on 11/26/24.
//

import Foundation

struct ChickenModel {
    let chickenImgUrl: String
    let chickenName: String
    let chickenPrice: String
    let chickenCount: Int
    let deliveryTips: String
    let isMenuTapped: Bool
    let menuType: Enum.MenuType = .honeyChicken
}

extension ChickenModel {
    func toItem() -> ChickenModel {
        return ChickenModel(chickenImgUrl: chickenImgUrl,
                            chickenName: chickenName,
                            chickenPrice: chickenPrice,
                            chickenCount: chickenCount,
                            deliveryTips: deliveryTips,
                            isMenuTapped: isMenuTapped)
    }
}
