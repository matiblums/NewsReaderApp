//
//  UserListView.swift
//  NewsReaderApp
//
//  Created by Matías Blum on 04/12/2024.
//

import SwiftUI

struct UserListView: View {
    @StateObject private var viewModel = UsersViewModel()
    @State private var selectedUser: User?
    
    var body: some View {
        NavigationStack {
            List(viewModel.users) { user in
                HStack {
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Image(systemName: "person.fill")
                                .foregroundColor(.blue)
                            Text(user.name.uppercased())
                                .font(.system(size: 18, weight: .semibold))
                        }
                        HStack {
                            Image(systemName: "person.circle")
                                .foregroundColor(.cyan)
                            Text(user.username)
                                .font(.system(size: 18, weight: .regular))
                                .foregroundColor(.secondary)
                        }
                        HStack {
                            Image(systemName: "envelope.fill")
                                .foregroundColor(.green)
                            Text(user.email)
                                .font(.system(size: 18, weight: .regular))
                                .foregroundColor(.gray)
                        }
                        HStack {
                            Image(systemName: "phone.fill")
                                .foregroundColor(.orange)
                            Text(user.phone)
                                .font(.system(size: 18, weight: .regular))
                                .foregroundColor(.gray)
                        }
                        HStack {
                            Image(systemName: "building.2.fill")
                                .foregroundColor(.purple)
                            Text(user.company.name)
                                .font(.system(size: 18, weight: .regular))
                                .foregroundColor(.secondary)
                        }
                        HStack {
                            Image(systemName: "globe")
                                .foregroundColor(.indigo)
                            Text(user.website)
                                .font(.system(size: 18, weight: .regular))
                                .foregroundColor(.blue)
                                .underline()
                        }
                    }
                    Spacer()
                    Button(action: {
                        selectedUser = user
                    }) {
                        Image(systemName: "mappin.and.ellipse")
                            .font(.system(size: 18, weight: .regular))
                            .foregroundColor(.red)
                    }
                }
            }
            .navigationTitle("Users")
            .navigationDestination(isPresented: Binding(
                get: { selectedUser != nil },
                set: { if !$0 { selectedUser = nil } }
            )) {
                if let user = selectedUser {
                    UserMapView(user: user)
                }
            }
        }
    }
}

struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
            .environmentObject(UsersViewModel(users: MockData.mockUsers))
    }
}
