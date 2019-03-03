//
//  Photos.swift
//  Flickr-Demo
//
//  Created by Xenos Xavier on 2019/2/27.
//  Copyright © 2019年 Xenos Xavier. All rights reserved.
//

import Foundation

struct Photos: Codable {
    var page: Int;
    var pages: Int;
    var perpage: Int;
    var total: String;
    var photo: [Photo]
}
