//
//  UIHelper.swift
//  AnimePicker
//
//  Created by Berkay Tuncel on 23.01.2023.
//

import UIKit

enum UIHelper {
    static func createHomeFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        // 10 x 5 x 10
        let itemWidth = (CGFloat.deviceWidth - 25) / 2
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.5)
        
        return layout
    }
}
