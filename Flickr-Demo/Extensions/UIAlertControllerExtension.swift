//
//  UIAlertControllerExtension.swift
//  Flickr-Demo
//
//  Created by Xenos Xavier on 2019/3/1.
//  Copyright © 2019年 Xenos Xavier. All rights reserved.
//

import UIKit

class UIAlertControllerExtension {
    static func createActionSheet(title: String?, message: String?, actions: [UIAlertAction]) -> UIAlertController {
        let actionSheet = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        self.addActions(actions, onActionSheet: actionSheet)
        return actionSheet
    }
    
    static func addActions(_ actions: [UIAlertAction], onActionSheet alertController: UIAlertController) {
        actions.forEach { action in
            alertController.addAction(action)
        }
    }
}
