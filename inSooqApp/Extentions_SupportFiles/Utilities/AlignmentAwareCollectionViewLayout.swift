//
//  ArabicCollectionViewLayout.swift
//  orood
//
//  Created by Deya on 08/02/2022.
//

import UIKit

class AlignmentAwareCollectionViewLayout: UICollectionViewFlowLayout {
    
    override var flipsHorizontallyInOppositeLayoutDirection: Bool {
        let isRTL = (Locale.current.languageCode == "ar")
        print("isRTL__",isRTL)
        return isRTL
    }
    
    override init() {
        super.init()
        self.scrollDirection = .horizontal
        self.itemSize = CGSize(width: 140, height: 40)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class StoreAdCollectionViewLayout: UICollectionViewFlowLayout {
    
    override var flipsHorizontallyInOppositeLayoutDirection: Bool {
        let isRTL = (Locale.current.languageCode == "ar")
        return isRTL
    }
    
    override init() {
        super.init()
        self.scrollDirection = .horizontal
        self.itemSize = CGSize(width: .max, height: 200)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

