//
//  SaveImageSuccessAction.swift
//  Flickr-Demo
//
//  Created by Xenos Xavier on 2019/3/3.
//  Copyright © 2019年 Xenos Xavier. All rights reserved.
//

import Foundation

struct SaveImageSuccessAction: Action {
    var photoObjects: [PhotoObject]
    
    init(photoObjects: [PhotoObject]) {
        self.photoObjects = photoObjects
    }
}
