//
//  SearchPhotoCommand.swift
//  Flickr-Demo
//
//  Created by Xenos Xavier on 2019/3/2.
//  Copyright © 2019年 Xenos Xavier. All rights reserved.
//

import Foundation

class SearchPhotoCommand {
    private let text: String
    private let perPage: String
    
    init(text: String, perPage: String) {
        self.text = text
        self.perPage = perPage
    }
    
    func exectue() {
        Store.shared.dispatch(action: SearchPhotoBeginningActoin(text: text, perPage: perPage))
        let apiPath = createFlickrSearchAPIPath(text: text, perPage: perPage)
        if let url = URL(string: apiPath) {
            URLSession.shared.dataTask(.promise, with: url).done { data, _ in
                self.parsePhotoFromJSON(data: data)
            }
        } else {
            let error = NSError(domain: "INVALID URL", code: 1, userInfo: ["Path": apiPath])
            Store.shared.dispatch(action: SearchPhotoErrorAction(error: error))
        }
    }
    
    private func parsePhotoFromJSON(data: Data) {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        do {
            let result = try decoder.decode(Result.self, from: data)
            Store.shared.dispatch(action: SearchPhotoSuccessAction(photos: result.photos.photo))
        } catch let error as NSError {
            Store.shared.dispatch(action: SearchPhotoErrorAction(error: error))
        }
    }
    
    private func createFlickrSearchAPIPath(text: String, perPage: String) -> String {
        let prefix = "https://api.flickr.com/services/rest/?method=flickr.photos.search"
        let apiKey = "&api_key=74c9a493f6a093b6fbeb7c29d7dd441a"
        let text = "&text=" + text.replacingOccurrences(of: " ", with: "+")
        let perPage = "&per_page=" + perPage
        let format = "&format=json&nojsoncallback=1"
        let origin = prefix + apiKey + text + perPage + format
        let encode = origin.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
//        print("API PATH = ", encode)
        return encode ?? origin
    }
}
