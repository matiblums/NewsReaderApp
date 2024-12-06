//
//  UserListViewTests.swift
//  NewsReaderAppTests
//
//  Created by Matías Blum on 06/12/2024.
//

import XCTest
import SwiftUI
@testable import NewsReaderApp

class UserListViewTests: XCTestCase {

    func testUserListViewDisplaysUsers() {
        let mockUsers = [
            User(
                id: 1,
                name: "John Doe",
                username: "johnd",
                email: "johndoe@example.com",
                address: Address(
                    street: "Mock Street",
                    suite: "Apt. 1",
                    city: "Mock City",
                    zipcode: "12345",
                    geo: Geo(lat: "37.7749", lng: "-122.4194")
                ),
                phone: "123-456-7890",
                website: "example.com",
                company: Company(name: "MockCorp", catchPhrase: "Mocking success", bs: "mocking")
            ),
            User(
                id: 2,
                name: "Jane Smith",
                username: "janes",
                email: "janesmith@example.com",
                address: Address(
                    street: "Another Street",
                    suite: "Suite 202",
                    city: "Another City",
                    zipcode: "54321",
                    geo: Geo(lat: "40.7128", lng: "-74.0060")
                ),
                phone: "987-654-3210",
                website: "anotherexample.com",
                company: Company(name: "AnotherCorp", catchPhrase: "Another success", bs: "another")
            )
        ]
        let viewModel = UsersViewModel(users: mockUsers)
        let userListView = UserListView()
            .environmentObject(viewModel)
        let hostingController = UIHostingController(rootView: userListView)
        XCTAssertNotNil(hostingController.view, "The view should load correctly.")
        XCTAssertEqual(viewModel.users.count, 2, "There should be 2 users in the ViewModel.")
    }

    func testUserListViewNavigationToUserMapView() {
        let mockUser = User(
            id: 1,
            name: "John Doe",
            username: "johnd",
            email: "johndoe@example.com",
            address: Address(
                street: "Mock Street",
                suite: "Apt. 1",
                city: "Mock City",
                zipcode: "12345",
                geo: Geo(lat: "37.7749", lng: "-122.4194")
            ),
            phone: "123-456-7890",
            website: "example.com",
            company: Company(name: "MockCorp", catchPhrase: "Mocking success", bs: "mocking")
        )
        let viewModel = UsersViewModel(users: [mockUser])
        let userListView = UserListView()
            .environmentObject(viewModel)
        let hostingController = UIHostingController(rootView: userListView)
        XCTAssertNotNil(hostingController.view, "The view should load correctly.")
        let selectedUser = viewModel.users.first
        XCTAssertNotNil(selectedUser, "A user should be selected.")
        if let user = selectedUser {
            let userMapView = UserMapView(user: user)
            XCTAssertNotNil(userMapView, "The UserMapView should be generated correctly.")
            XCTAssertEqual(user.address.geo.lat, "37.7749", "The user's latitude should match.")
            XCTAssertEqual(user.address.geo.lng, "-122.4194", "The user's longitude should match.")
        }
    }
}
