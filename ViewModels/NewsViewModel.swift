//
//  NewsViewModel.swift
//  NewsReaderApp
//
//  Created by Matías Blum on 04/12/2024.
//

import Combine

class NewsViewModel: ObservableObject {
    @Published var posts: [Post] = []
    @Published var searchText: String = ""
    @Published var filteredPosts: [Post] = []
    private var cancellables = Set<AnyCancellable>()
    
    init(posts: [Post] = []) {
        self.posts = posts
        self.filteredPosts = posts
        setupSearch()
    }

    func fetchPosts(completion: @escaping () -> Void) {
        APIService.shared.fetchPosts()
            .map { posts in
                posts.map { post in
                    Post(
                        id: post.id,
                        title: post.title,
                        body: post.body.replacingOccurrences(of: "\n", with: " ")
                    )
                }
            }
            .sink(receiveCompletion: { _ in
                completion()
            }) { [weak self] posts in
                self?.posts = posts
                self?.filteredPosts = posts
                completion()
            }
            .store(in: &cancellables)
    }

    private func setupSearch() {
        $searchText
            .combineLatest($posts)
            .map { (query, posts) in
                guard !query.isEmpty else { return posts }
                return posts.filter {
                    $0.title.localizedCaseInsensitiveContains(query) ||
                    $0.body.localizedCaseInsensitiveContains(query)
                }
            }
            .assign(to: &$filteredPosts)
    }
}
