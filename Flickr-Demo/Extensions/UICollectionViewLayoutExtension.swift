//
//  UICollectionViewLayoutUtility.swift
//  Flickr-Demo
//
//  Created by Xenos Xavier on 2019/2/27.
//  Copyright © 2019年 Xenos Xavier. All rights reserved.
//

import UIKit

class UICollectionViewLayoutExtension {
    static func getFlickrCollectionViewLayout() -> UICollectionViewLayout {
        let spacing: CGFloat = 15
        let width = (UIScreen.main.bounds.width - spacing * 3) / 2
        let layout = UICollectionViewFlowLayout();
        layout.itemSize = CGSize(width: width, height: width)   // cell size
        layout.minimumLineSpacing = spacing                     // spacing between cell and another cell (same column)
        layout.minimumInteritemSpacing = spacing                // spacing between cell and another cell (same row)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        return layout
    }
}
