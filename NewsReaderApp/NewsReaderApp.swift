//
//  NewsReaderApp.swift
//  NewsReaderApp
//
//  Created by Matías Blum on 04/12/2024.
//

import SwiftUI
import GoogleMaps

@main
struct NewsReaderApp: App {
    init() {
        GMSServices.provideAPIKey("AIzaSyD4x7sngZv_6tNYrmtD2PdugU7wMUASSik")
    }
    
    var body: some Scene {
        WindowGroup {
            TabView {
                NewsListView()
                    .tabItem {
                        Label("Noticias", systemImage: "newspaper")
                    }
                
                UserListView()
                    .tabItem {
                        Label("Usuarios", systemImage: "person.3")
                    }
            }
        }
    }
}
