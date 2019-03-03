//
//  Store.swift
//  Flickr-Demo
//
//  Created by Xenos Xavier on 2019/3/2.
//  Copyright © 2019年 Xenos Xavier. All rights reserved.
//

import Foundation

enum StoreNotification: String {
    case STATE_UPDATE = "stateUpdate"
}

class Store {
    public static let shared = Store()
    public let notificationCenter = NotificationCenter()
    private(set) var state = StoreState()
    
    private init() {
        
    }
    
    public func dispatch(action: Action) {
        self.state = reduce(oldState: self.state, action: action)
        self.notificationCenter.post(Notification(name: Notification.Name(StoreNotification.STATE_UPDATE.rawValue)))
    }
    
    private func reduce(oldState: StoreState, action: Action) -> StoreState {
        var newState = oldState
        if let act = action as? SearchPhotoBeginningActoin {
            newState.text = act.text
            newState.perPage = act.perPage
            newState.photos = []
            newState.error = nil
        } else if let act = action as? SearchPhotoSuccessAction {
            newState.photos = act.photos
        } else if let act = action as? SearchPhotoErrorAction {
            newState.error = act.error
        } else if let act = action as? SaveImageSuccessAction {
            newState.photoObjects = act.photoObjects
        }
        print("OLD STATE = \(oldState)\nNEW STATE = \(newState)\nAction = \(action)\n")
        return newState
    }
}
