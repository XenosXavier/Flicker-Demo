//
//  SaveImageCommand.swift
//  Flickr-Demo
//
//  Created by Xenos Xavier on 2019/3/3.
//  Copyright © 2019年 Xenos Xavier. All rights reserved.
//

import Foundation

class SaveImageCommand {
    private let title: String
    private let imageData: Data
    
    init(title: String, imageData: Data) {
        self.title = title
        self.imageData = imageData
    }
    
    func exectue() {
        let object = PhotoObject()
        object.title = title
        object.data = imageData
        RealmStore.shared.add(object: object).done { success in
            Store.shared.dispatch(action: SaveImageSuccessAction(photoObjects: RealmStore.shared.getObjects(type: PhotoObject.self)))
        }.catch { error in
            Store.shared.dispatch(action: SaveImageErrorAction(error: error))
        }
    }
}
