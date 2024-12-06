//
//  Post.swift
//  NewsReaderApp
//
//  Created by Matías Blum on 04/12/2024.
//

struct Post: Codable, Identifiable {
    let id: Int
    let title: String
    let body: String
}
