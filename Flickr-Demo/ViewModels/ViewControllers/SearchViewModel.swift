//
//  SearchViewModel.swift
//  Flickr-Demo
//
//  Created by Xenos Xavier on 2019/2/27.
//  Copyright © 2019年 Xenos Xavier. All rights reserved.
//

import Foundation

class SearchViewModel {
    private let enabledButtonColor: UInt32 = 0x2C7CF6;
    private let disabledButtonColor: UInt32 = 0xBDBDbD;
    private let invalidExpression = ["text": "", "perPage": "[^0-9]"]
    private(set) var isButtonEnabled: Bool = false;
    private(set) var text: String = "";
    private(set) var perPage: String = "";
    
    func updateState(byTextFieldId id: String, andText text: String) {
        if id == "text" {
            self.text = text
        } else if id == "perPage" {
            self.perPage = text
        }
        self.isButtonEnabled = (!text.isEmpty && !perPage.isEmpty)
    }
    
    func isValidString(id: String?, text: String?, replacementRange range: NSRange, replacementString string: String) -> Bool {
        if let id = id, let text = text, let invalidExp = invalidExpression[id] {
            print("Invalid Expression", invalidExp)
            let newString = (text as NSString).replacingCharacters(in: range, with: string)
            return newString.range(of: invalidExp, options: .regularExpression, range: nil, locale: nil) == nil
        }
        return true
    }
    
    func getButtonColor() -> UInt32 {
        return self.isButtonEnabled ? enabledButtonColor : disabledButtonColor;
    }

    func searchPhoto() {
        SearchPhotoCommand(text: text, perPage: perPage).exectue()
    }
    
}
