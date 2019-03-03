//
//  StoreState.swift
//  Flickr-Demo
//
//  Created by Xenos Xavier on 2019/3/3.
//  Copyright © 2019年 Xenos Xavier. All rights reserved.
//

import Foundation

struct StoreState {
    var text: String = ""
    var perPage: String = ""
    var photos: [Photo] = []
    var error: Error? = nil
    var photoObjects: [PhotoObject] = RealmStore.shared.getObjects(type: PhotoObject.self)
}
