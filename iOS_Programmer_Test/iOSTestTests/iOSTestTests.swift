//
//  iOSTestTests.swift
//  iOSTestTests
//
//  Created by Fabrizio Sposetti on 06/06/2019.
//  Copyright © 2019 D&ATechnologies. All rights reserved.
//

import XCTest
@testable import iOSTest


class iOSTestTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
    
    public func testlogin_Ok() {
        let loginViewModel = LoginViewModel(email: "info@datechnologies.co", password: "Test123")
        
        DAO.instance.login(loginViewModel: loginViewModel) { response, error, requestDuration in
                XCTAssertNotNil(response)
                XCTAssertNil(error)
        }
    }
    
    public func testlogin_Fail() {
        let loginViewModel = LoginViewModel(email: "info@datechnologies.co", password: "asdasd")
        
        DAO.instance.login(loginViewModel: loginViewModel) { response, error, requestDuration in
            XCTAssertNotNil(error)
            XCTAssertNil(response)
        }
    }
    
    public func testMessages() {
        DAO.instance.getMessages { response, error, requestDuration in
                XCTAssertNotNil(response)
                XCTAssertNil(error)
        }
    }

}
