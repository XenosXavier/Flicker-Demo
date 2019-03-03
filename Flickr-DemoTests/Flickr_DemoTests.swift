//
//  Flickr_DemoTests.swift
//  Flickr-DemoTests
//
//  Created by Xenos Xavier on 2019/2/27.
//  Copyright © 2019年 Xenos Xavier. All rights reserved.
//

import XCTest
@testable import Flickr_Demo

class Flickr_DemoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRealmOperation() {
        let saveExpectation = expectation(description: "Save Completed")
        let photoObject = PhotoObject()
        photoObject.title = "DOGE"
        photoObject.data = Data()
        RealmService.shared.add(object: photoObject).done { success in
            if success {
                saveExpectation.fulfill()
            }
        }
        
        wait(for: [saveExpectation], timeout: 10)
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
