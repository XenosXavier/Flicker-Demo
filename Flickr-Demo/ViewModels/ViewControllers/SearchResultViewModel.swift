//
//  SearchResultViewModel.swift
//  Flickr-Demo
//
//  Created by Xenos Xavier on 2019/2/27.
//  Copyright © 2019年 Xenos Xavier. All rights reserved.
//

import Foundation

protocol SearchResultViewModelDelegate: class {
    func searchPhotoDidUpdate()
}

class SearchResultViewModel {
    public weak var delegate: SearchResultViewModelDelegate? = nil
    private var photos: [Photo] = []
    
    init() {
        Store.shared.notificationCenter.addObserver(self, selector: #selector(fetchPhotos), name: Notification.Name(rawValue: StoreNotification.STATE_UPDATE.rawValue), object: nil)
        fetchPhotos()
    }
    
    @objc private func fetchPhotos() {
        self.photos = Store.shared.state.photos
        delegate?.searchPhotoDidUpdate()
    }
    
    func getNumberOfPhotos() -> Int {
        return self.photos.count
    }
    
    deinit {
        Store.shared.notificationCenter.removeObserver(self)
    }
}
