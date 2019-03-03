//
//  Photo.swift
//  Flickr-Demo
//
//  Created by Xenos Xavier on 2019/2/27.
//  Copyright © 2019年 Xenos Xavier. All rights reserved.
//

import Foundation

struct Photo: Codable {
    var id: String;
    var owner: String;
    var secret: String;
    var server: String;
    var farm: Int;
    var title: String;
    var ispublic: Int;
    var isfriend: Int;
    var isfamily: Int;
    
    var imagePath: String {
        return "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret).jpg"
    }
}
