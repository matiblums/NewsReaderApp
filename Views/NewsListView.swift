//
//  NewsListView.swift
//  NewsReaderApp
//
//  Created by Matías Blum on 04/12/2024.
//

import SwiftUI

struct NewsListView: View {
    @StateObject private var viewModel = NewsViewModel()
    @State private var isLoading = true
    
    var body: some View {
        NavigationView {
            Group {
                if isLoading {
                    ProgressView("Loading News...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .font(.headline)
                } else {
                    List(viewModel.filteredPosts) { post in
                        NavigationLink(destination: NewsDetailView(post: post)) {
                            VStack(alignment: .leading) {
                                Text(post.title.uppercased())
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(.black)
                                    .lineLimit(1)
                                    .truncationMode(.tail)
                                Text(post.body)
                                    .font(.system(size: 18, weight: .regular))
                                    .foregroundColor(.gray)
                                    .lineLimit(2)
                                    .truncationMode(.tail)
                            }
                        }
                    }
                }
            }
            .onAppear {
                loadNews()
            }
            .navigationTitle("News")
        }
    }
    
    private func loadNews() {
        viewModel.fetchPosts {
            isLoading = false
        }
    }
}

// MARK: - Preview

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
            .environmentObject(NewsViewModel(posts: MockData.mockPosts))
    }
}
