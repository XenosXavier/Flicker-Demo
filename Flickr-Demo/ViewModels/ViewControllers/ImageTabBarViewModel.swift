//
//  ImageTabBarViewModel.swift
//  Flickr-Demo
//
//  Created by Xenos Xavier on 2019/2/27.
//  Copyright © 2019年 Xenos Xavier. All rights reserved.
//

import Foundation

protocol ImageTabBarViewModelDelegate: class {
    func searchTextDidRetrieve()
}

class ImageTabBarViewModel {
    public var delegate: ImageTabBarViewModelDelegate? = nil
    private var text: String = ""
    private var searchPrefixText = "搜尋結果 "
    private var favoriteText = "我的最愛"
    
    init() {
        Store.shared.notificationCenter.addObserver(self, selector: #selector(fetchSearchText), name: Notification.Name(StoreNotification.STATE_UPDATE.rawValue), object: nil)
        fetchSearchText()
    }
    
    @objc private func fetchSearchText() {
        self.text = Store.shared.state.text
        self.delegate?.searchTextDidRetrieve()
    }
    
    func getNavigationTitle(selectedIndex: Int) -> String {
        return selectedIndex == 0 ? searchPrefixText + text : favoriteText
    }
    
    deinit {
        Store.shared.notificationCenter.removeObserver(self)
    }
    
}
