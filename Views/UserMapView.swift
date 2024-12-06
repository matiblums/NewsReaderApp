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
    static let sharedMapView = GMSMapView()
    func makeUIView(context: Context) -> GMSMapView {
        let mapView = UserMapView.sharedMapView
        configureMapView(mapView)
        return mapView
    }
    func updateUIView(_ uiView: GMSMapView, context: Context) {
        configureMapView(uiView)
    }
    private func configureMapView(_ mapView: GMSMapView) {
        let camera = GMSCameraPosition.camera(
            withLatitude: Double(user.address.geo.lat) ?? 0.0,
            longitude: Double(user.address.geo.lng) ?? 0.0,
            zoom: 2
        )
        mapView.animate(to: camera)
        mapView.clear()
        let marker = createMarker()
        marker.map = mapView
        mapView.selectedMarker = marker
    }
    private func createMarker() -> GMSMarker {
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
        return marker
    }
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
