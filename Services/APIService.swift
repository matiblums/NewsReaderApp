//
//  APIService.swift
//  NewsReaderApp
//
//  Created by Matías Blum on 04/12/2024.
//

import Foundation
import Combine

class APIService {
    static let shared = APIService()
    private init() {}
    private let baseURL = "https://jsonplaceholder.typicode.com/"
    var session: URLSession = .shared
    func fetchPosts() -> AnyPublisher<[Post], Error> {
        let url = URL(string: "\(baseURL)posts")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .handleEvents(receiveOutput: { data, _ in
                            if let jsonString = String(data: data, encoding: .utf8) {
                                print("JSON (Posts): \(jsonString)")
                            }
                        })
            .map(\.data)
            .decode(type: [Post].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func fetchUsers() -> AnyPublisher<[User], Error> {
        let url = URL(string: "\(baseURL)users")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .handleEvents(receiveOutput: { data, _ in
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("JSON (Users): \(jsonString)")
                }
            })
            .map(\.data)
            .decode(type: [User].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
