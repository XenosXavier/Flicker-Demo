//
//  FlickrCellViewModel.swift
//  Flickr-Demo
//
//  Created by Xenos Xavier on 2019/2/28.
//  Copyright © 2019年 Xenos Xavier. All rights reserved.
//

import Foundation

class FlickrCellViewModel {
    private var indexPath = IndexPath(row: -1, section: -1)
    private var photo: Photo? = nil
    
    func updateState(indexPath: IndexPath) {
        self.indexPath = indexPath
        self.photo = Store.shared.state.photos[indexPath.row]
    }
    
    func getPhotoTitle() -> String {
        return self.photo?.title ?? ""
    }
    
    func getPhotoURL() -> URL {
        let path = self.photo?.imagePath ?? ""
        return URL(string: path)!
    }

    func saveImage(title: String, data: Data) {
        SaveImageCommand(title: title, imageData: data).exectue()
    }
}
