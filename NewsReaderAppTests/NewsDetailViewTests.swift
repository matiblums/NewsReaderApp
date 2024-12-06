//
//  NewsDetailViewTests.swift
//  NewsReaderAppTests
//
//  Created by Matías Blum on 04/12/2024.
//

import XCTest
import SwiftUI
@testable import NewsReaderApp

class NewsDetailViewTests: XCTestCase {

    func testNewsDetailViewDisplaysContentCorrectly() {
        let mockPost = Post(id: 1, title: "Breaking News", body: "This is the content of the news article.")
        let view = NewsDetailView(post: mockPost)
        let hostController = UIHostingController(rootView: view)
        XCTAssertNotNil(hostController.view, "The view should be rendered.")
        hostController.viewWillAppear(true)
        XCTAssertEqual(view.post.title, "Breaking News", "The title should match the mock data.")
        XCTAssertEqual(view.post.body, "This is the content of the news article.", "The body should match the mock data.")
    }
}
