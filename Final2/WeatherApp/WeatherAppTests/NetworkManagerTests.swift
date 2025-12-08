//
//  NetworkManagerTests.swift
//  WeatherApp
//
//  Created by Аяулым Куат on 08.12.2025.
//

import XCTest
@testable import WeatherApp

class NetworkManagerTests: XCTestCase {
    func testFetchNews() {
        let expectation = self.expectation(description: "Fetch news")
        
        NetworkManager.shared.fetchNews { result in
            switch result {
            case .success(let articles):
                XCTAssertTrue(articles.count > 0)
                expectation.fulfill()
            case .failure:
                XCTFail("Failed to fetch news")
            }
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
}
