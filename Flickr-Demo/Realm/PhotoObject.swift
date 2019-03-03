//
//  PhotoObject.swift
//  Flickr-Demo
//
//  Created by Xenos Xavier on 2019/3/3.
//  Copyright © 2019年 Xenos Xavier. All rights reserved.
//

import Foundation
import RealmSwift

class PhotoObject: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var data: Data = Data()
}
