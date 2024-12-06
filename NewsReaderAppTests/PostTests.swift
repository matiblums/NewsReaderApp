//
//  NewsReaderAppTests.swift
//  NewsReaderAppTests
//
//  Created by Matías Blum on 04/12/2024.
//

import XCTest
@testable import NewsReaderApp

class PostTests: XCTestCase {

    func testNewsTitle() throws {
        let mockPost = Post(id: 0, title: "Breaking News", body: "This is a test body.")
        let title = mockPost.title
        XCTAssertEqual(title, "Breaking News", "The news title does not match.")
    }
    
}
