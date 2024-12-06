//
//  UserMapViewTests.swift
//  NewsReaderAppTests
//
//  Created by Matías Blum on 04/12/2024.
//

import XCTest
import GoogleMaps
@testable import NewsReaderApp

class UserMapViewTests: XCTestCase {
    
    func testUserMapViewInitialConfiguration() {
        let mapView = GMSMapView()
        let camera = GMSCameraPosition.camera(withLatitude: 37.7749, longitude: -122.4194, zoom: 4)
        mapView.camera = camera
        mapView.moveCamera(GMSCameraUpdate.setCamera(camera))
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194)
        marker.title = "John Doe"
        marker.snippet = """
        Address: Mock Street, Apt. 1, Mock City
        Zipcode: 12345
        """
        marker.map = mapView
        mapView.selectedMarker = marker

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            XCTAssertEqual(mapView.camera.zoom, 4, "The zoom level should be 4.")
            XCTAssertNotNil(marker, "The marker should not be nil.")
            XCTAssertEqual(marker.position.latitude, 37.7749, accuracy: 0.0001, "The marker's latitude should match the user's location.")
            XCTAssertEqual(marker.position.longitude, -122.4194, accuracy: 0.0001, "The marker's longitude should match the user's location.")
            XCTAssertEqual(marker.title, "John Doe", "The marker's title should be the user's name.")
            XCTAssertEqual(marker.snippet, """
            Address: Mock Street, Apt. 1, Mock City
            Zipcode: 12345
            """, "The marker's snippet should match the user's address.")
        }
    }

}
