//
//  MockData.swift
//  NewsReaderApp
//
//  Created by Matías Blum on 05/12/2024.
//

import Foundation

struct MockData {
    static let mockPost = Post(
        id: 1,
        title: "Sample News Title",
        body: "This is an example of the body content for a news article. It showcases the detail view of the NewsReaderApp."
    )
    static let mockPosts: [Post] = [
        Post(
            id: 1,
            title: "Breaking News: SwiftUI Updates",
            body: "SwiftUI introduces new features for building modern UIs faster and more efficiently."
        ),
        Post(
            id: 2,
            title: "Tech World: AI Breakthroughs",
            body: "Artificial Intelligence is now capable of generating high-quality code snippets and much more."
        ),
        Post(
            id: 3,
            title: "Global News: Climate Action",
            body: "Countries worldwide are collaborating to address climate change and its challenges."
        )
    ]
    static let mockUsers: [User] = [
        User(
            id: 1,
            name: "John Doe",
            username: "johndoe",
            email: "john@example.com",
            address: Address(
                street: "123 Main St",
                suite: "Apt 1",
                city: "Sample City",
                zipcode: "12345",
                geo: Geo(lat: "37.7749", lng: "-122.4194")
            ),
            phone: "555-555-5555",
            website: "johndoe.com",
            company: Company(
                name: "Sample Company",
                catchPhrase: "Innovate your world",
                bs: "synergize scalable solutions"
            )
        ),
        User(
            id: 2,
            name: "Jane Smith",
            username: "janesmith",
            email: "jane@example.com",
            address: Address(
                street: "456 Elm St",
                suite: "Apt 2",
                city: "Sample Town",
                zipcode: "67890",
                geo: Geo(lat: "34.0522", lng: "-118.2437")
            ),
            phone: "987-654-3210",
            website: "janesmith.com",
            company: Company(
                name: "Smith LLC",
                catchPhrase: "Making your dreams come true",
                bs: "leverage cutting-edge technology"
            )
        )
    ]
    static let mockUser = User(
            id: 1,
            name: "John Doe",
            username: "johndoe",
            email: "john@example.com",
            address: Address(
                street: "123 Main St",
                suite: "Apt 1",
                city: "Sample City",
                zipcode: "12345",
                geo: Geo(lat: "37.7749", lng: "-122.4194")
            ),
            phone: "555-555-5555",
            website: "johndoe.com",
            company: Company(
                name: "Sample Company",
                catchPhrase: "Innovate your world",
                bs: "synergize scalable solutions"
            )
        )
        
        static let anotherMockUser = User(
            id: 2,
            name: "Jane Smith",
            username: "janesmith",
            email: "jane@example.com",
            address: Address(
                street: "456 Elm St",
                suite: "Apt 2",
                city: "Sample Town",
                zipcode: "67890",
                geo: Geo(lat: "34.0522", lng: "-118.2437")
            ),
            phone: "987-654-3210",
            website: "janesmith.com",
            company: Company(
                name: "Smith LLC",
                catchPhrase: "Making your dreams come true",
                bs: "leverage cutting-edge technology"
            )
        )
}
