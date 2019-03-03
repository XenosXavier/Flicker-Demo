//
//  RealmStore.swift
//  Flickr-Demo
//
//  Created by Xenos Xavier on 2019/3/3.
//  Copyright © 2019年 Xenos Xavier. All rights reserved.
//

import Foundation
import RealmSwift
import PromiseKit

class RealmStore {
    public static let shared = RealmStore()
    private let config = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
    private let taskQueue = DispatchQueue(label: "com.realm.sync.queue", qos: .background)
    public let realm: Realm?
    
    private init() {
        self.realm = try? Realm(configuration: config)
    }
    
    public func add(object: Object) -> Promise<Bool> {
        return Promise { resolver in
            do {
                try syncAdd(object: object)
                resolver.fulfill(true)
            } catch let error as NSError {
                resolver.reject(error)
            }
        }
    }
    
    private func syncAdd(object: Object) throws {
        do {
            try taskQueue.sync {
                try self.realm?.write {
                    self.realm?.add(object)
                }
            }
        } catch let error as NSError {
            throw error
        }
    }
    
    public func getObjects<T: Object>(type: T.Type) -> [T] {
        if let objects = realm?.objects(type) {
            return Array(objects)
        }
        return []
    }
}
