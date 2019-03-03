//
//  FavoriteViewModel.swift
//  Flickr-Demo
//
//  Created by Xenos Xavier on 2019/3/3.
//  Copyright © 2019年 Xenos Xavier. All rights reserved.
//

import Foundation

protocol FavoriteViewModelDelegate: class {
    func favoritePhotoDidRetrieve()
}

class FavoriteViewModel {
    public weak var delegate: FavoriteViewModelDelegate? = nil
    private var photos: [PhotoObject] = []
    
    init() {
        Store.shared.notificationCenter.addObserver(self, selector: #selector(fetchPhotos), name: Notification.Name(StoreNotification.STATE_UPDATE.rawValue), object: nil)
        
        fetchPhotos()
        print("MY PHOTO = \(photos)")
    }
    
    @objc private func fetchPhotos() {
        self.photos = Store.shared.state.photoObjects
        self.delegate?.favoritePhotoDidRetrieve()
    }
    
    func getNumberOfPhotos() -> Int {
        return self.photos.count
    }
    
    deinit {
        Store.shared.notificationCenter.removeObserver(self)
    }
}
