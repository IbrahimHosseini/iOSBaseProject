//
//  URLSessionAPIClient.swift
//  iOSBaseProject
//
//  Created by Ibrahim on 4/22/24.
//

import Combine
import Foundation

class URLSessionAPIClient<EndpointType: APIEndpoint>: APIClient {

    func request<T: Decodable>(_ endpoint: EndpointType) -> AnyPublisher<T, Error> {

        /// set the path and create the complete url
        let url = endpoint.baseURL.appendingPathComponent(endpoint.path)
        
        /// create a request and set the http method
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        
        /// set all headers
        endpoint.headers?.forEach { request.addValue($0.value, forHTTPHeaderField: $0.key) }
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .map(\.data)
            .print("data")
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
