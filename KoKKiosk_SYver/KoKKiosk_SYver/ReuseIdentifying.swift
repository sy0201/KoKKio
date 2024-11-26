//
//  ReuseIdentifying.swift
//  KoKKiosk_SYver
//
//  Created by siyeon park on 11/26/24.
//

protocol ReuseIdentifying: AnyObject {
    static var reuseIdentifier: String { get }
}

extension ReuseIdentifying {
    static var reuseIdentifier: String {
        String(describing: self)
    }
}
