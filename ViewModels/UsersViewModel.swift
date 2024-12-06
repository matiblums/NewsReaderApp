//
//  UsersViewModel.swift
//  NewsReaderApp
//
//  Created by Matías Blum on 04/12/2024.
//

import Combine

class UsersViewModel: ObservableObject {
    @Published var users: [User] = []
    private var cancellables = Set<AnyCancellable>()
    
    init(users: [User] = []) {
        self.users = users
        fetchUsers()
    }
    
    func fetchUsers() {
        APIService.shared.fetchUsers()
            .sink(receiveCompletion: { _ in }) { [weak self] users in
                self?.users = users
            }
            .store(in: &cancellables)
    }
}
