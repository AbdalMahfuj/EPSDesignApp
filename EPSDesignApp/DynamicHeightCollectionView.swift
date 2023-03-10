//
//  DynamicHeightCollectionView.swift
//  EPSDesignApp
//
//  Created by MAHFUJ on 10/3/23.
//

import UIKit

class DynamicHeightCollectionView : UICollectionView {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if bounds.size != intrinsicContentSize {
            self.invalidateIntrinsicContentSize()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        return collectionViewLayout.collectionViewContentSize
    }
}
