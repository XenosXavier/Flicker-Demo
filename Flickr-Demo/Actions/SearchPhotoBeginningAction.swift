//
//  SearchPhotoBeginningAction.swift
//  Flickr-Demo
//
//  Created by Xenos Xavier on 2019/3/3.
//  Copyright © 2019年 Xenos Xavier. All rights reserved.
//

import Foundation

class SearchPhotoBeginningActoin: Action {
    let text: String
    let perPage: String
    
    init(text: String, perPage: String) {
        self.text = text
        self.perPage = perPage
    }
}
