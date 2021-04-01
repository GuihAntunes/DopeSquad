//
//  EndpointsTests.swift
//  DopeSquadTests
//
//  Created by Guilherme Antunes on 01/04/2021.
//

import XCTest
@testable import DopeSquad

class EndpointsTests: XCTestCase {

    var sut: Endpoint!
    
    func testListEndpoint_shouldReturnTheProperURL() {
        sut = HeroesEndpoints.list(lastIndex: 0)
        XCTAssertNotNil(sut.request.url?.absoluteString.contains("limit=20"))
        XCTAssertNotNil(sut.request.url?.absoluteString.contains("offset=0"))
        XCTAssertNotNil(sut.request.url?.absoluteString.contains("apikey"))
        XCTAssertNotNil(sut.request.url?.absoluteString.contains("hash"))
        XCTAssertNotNil(sut.request.url?.absoluteString.contains("ts"))
        XCTAssertNotNil(sut.request.url?.absoluteString.contains("https://gateway.marvel.com/v1/public/characters?"))
    }
    
    func testListEndpoint_shouldReturnTheProperURLForProperOffset() {
        sut = HeroesEndpoints.list(lastIndex: 100)
        XCTAssertNotNil(sut.request.url?.absoluteString.contains("limit=20"))
        XCTAssertNotNil(sut.request.url?.absoluteString.contains("offset=100"))
        XCTAssertNotNil(sut.request.url?.absoluteString.contains("apikey"))
        XCTAssertNotNil(sut.request.url?.absoluteString.contains("hash"))
        XCTAssertNotNil(sut.request.url?.absoluteString.contains("ts"))
        XCTAssertNotNil(sut.request.url?.absoluteString.contains("https://gateway.marvel.com/v1/public/characters?"))
    }

}
