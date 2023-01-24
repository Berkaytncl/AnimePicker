//
//  UICollectionView+Ext.swift
//  AnimePicker
//
//  Created by Berkay Tuncel on 20.01.2023.
//

import UIKit

extension UICollectionView {
    func reloadOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
}
