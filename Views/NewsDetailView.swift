//
//  NewsDetailView.swift
//  NewsReaderApp
//
//  Created by Matías Blum on 04/12/2024.
//

import SwiftUI

struct NewsDetailView: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(post.title.uppercased())
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(.black)
            Text(post.body)
                .font(.system(size: 18, weight: .regular))
                .foregroundColor(.gray)
            Spacer()
        }
        .padding()
        .navigationTitle("Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Preview
struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView(post: MockData.mockPost)
    }
}

