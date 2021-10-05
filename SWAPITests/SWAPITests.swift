//
//  SWAPITests.swift
//  SWAPITests
//
//  Created by Stephen Byatt on 5/10/21.
//

import XCTest
@testable import SWAPI

extension Notification.Name {
    static let evPassed = Notification.Name("evPassed")
}

class SWAPITests: XCTestCase {
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetShips() throws {
        expectation(forNotification: .evPassed, object: nil, handler: nil)

        let path = SWAPI.basePath + "starships"
        SWAPI.getStarshipsForPage(pageURL: path, handler: shipHandler)
        
        waitForExpectations(timeout: 10.0, handler: nil)

    }
    
    func shipHandler(next: String?, ships: [Starship]) {
        print(ships)
        XCTAssertFalse(ships.isEmpty)
        if let next = next {
            SWAPI.getStarshipsForPage(pageURL: next, handler: shipHandler)
            return
        }
        NotificationCenter.default.post(name: .evPassed, object: nil)
    }
    
    func testGetFilms() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let e = expectation(description: "Alamofire")
        
        SWAPI.getFilms { f in
            XCTAssertNotNil(f)
            print(f)
            e.fulfill()
        }
        waitForExpectations(timeout: 10.0, handler: nil)
    }
    
    func testGetPerson() throws {
        let e = expectation(description: "Alamofire")
        var path = SWAPI.basePath + "people/13"
        SWAPI.getPerson(from: path) { person in
            XCTAssertNotNil(person)
            print(person)
            e.fulfill()
        }
        
        waitForExpectations(timeout: 10.0, handler: nil)
    }
    
}
