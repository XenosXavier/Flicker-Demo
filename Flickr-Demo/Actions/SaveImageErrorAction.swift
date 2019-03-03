//
//  SaveImageErrorAction.swift
//  Flickr-Demo
//
//  Created by Xenos Xavier on 2019/3/3.
//  Copyright © 2019年 Xenos Xavier. All rights reserved.
//

import Foundation

struct SaveImageErrorAction: Action {
    var error: Error
    
    init(error: Error) {
        self.error = error
    }
}
