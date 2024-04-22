//
//  Network.swift
//  iOSBaseProject
//
//  Created by Ibrahim on 4/22/24.
//

import Combine

protocol APIClient {
    associatedtype EndpointType: APIEndpoint
    
    func request<T: Decodable>(_ endpoint: EndpointType) -> AnyPublisher<T, Error>
}


