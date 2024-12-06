//
//  UserMapView.swift
//  NewsReaderApp
//
//  Created by Matías Blum on 04/12/2024.
//

import SwiftUI
import GoogleMaps

struct UserMapView: UIViewRepresentable {
    let user: User
    
    func makeUIView(context: Context) -> GMSMapView {
        let mapView = GMSMapView()
        let camera = GMSCameraPosition.camera(
            withLatitude: Double(user.address.geo.lat) ?? 0.0,
            longitude: Double(user.address.geo.lng) ?? 0.0,
            zoom: 2
        )
        mapView.camera = camera
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(
            latitude: Double(user.address.geo.lat) ?? 0.0,
            longitude: Double(user.address.geo.lng) ?? 0.0
        )
        marker.title = user.name
        marker.snippet = """
        Address: \(user.address.street), \(user.address.suite), \(user.address.city)
        Zipcode: \(user.address.zipcode)
        """
        marker.map = mapView
        mapView.selectedMarker = marker
        return mapView
    }
    
    func updateUIView(_ uiView: GMSMapView, context: Context) {}
}

// MARK: - Preview
struct UserMapView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            UserMapView(user: MockData.mockUser)
                .previewDisplayName("Default Location")
            
            UserMapView(user: MockData.anotherMockUser)
                .previewDisplayName("Another Location")
        }
    }
}
