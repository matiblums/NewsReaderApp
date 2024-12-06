//
//  MockURLProtocol.swift
//  NewsReaderApp
//
//  Created by Matías Blum on 06/12/2024.
//

import Foundation
import Combine

class MockURLProtocol: URLProtocol {
    static var mockResponse: (data: Data, statusCode: Int)?
    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        print("Start loading: \(request)")
        guard let response = MockURLProtocol.mockResponse, let url = request.url else {
            print("No valid mock response")
            client?.urlProtocol(self, didFailWithError: URLError(.badURL))
            client?.urlProtocolDidFinishLoading(self)
            return
        }

        let httpResponse = HTTPURLResponse(
            url: url,
            statusCode: response.statusCode,
            httpVersion: nil,
            headerFields: nil
        )!
        print("Mocking response: \(httpResponse)")
        client?.urlProtocol(self, didReceive: httpResponse, cacheStoragePolicy: .notAllowed)
        client?.urlProtocol(self, didLoad: response.data)
        client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {}
}
