//
//  FavoriteCellViewModel.swift
//  Flickr-Demo
//
//  Created by Xenos Xavier on 2019/3/3.
//  Copyright © 2019年 Xenos Xavier. All rights reserved.
//

import Foundation

class FavoriteCellViewModel {
    private var indexPath = IndexPath(row: -1, section: -1)
    private var photo = PhotoObject()
    
    func updateState(indexPath: IndexPath) {
        self.indexPath = indexPath
        self.photo = Store.shared.state.photoObjects[indexPath.row]
    }
    
    func getPhotoTitle() -> String {
        return photo.title
    }
    
    func getPhotoData() -> Data {
        return photo.data
    }
    
}
