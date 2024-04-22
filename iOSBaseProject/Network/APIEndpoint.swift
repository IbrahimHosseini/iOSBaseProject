//
//  APIEndpoint.swift
//  iOSBaseProject
//
//  Created by Ibrahim on 4/22/24.
//

import Foundation

protocol APIEndpoint {
    
    /// base of API url
    var baseURL: URL { get }
    
    /// path of the endpoint API
    var path: String { get }
    
    /// set the HTTP method of API
    var method: HTTPMethod { get }
    
    /// set the headers for API
    var headers: [String: String]? { get }
    
    /// set the API parameters
    var parameters: [String: Any]? { get }
}

extension APIEndpoint {
    
    /// set the base url from environment
    var baseURL: URL { URL(string: "http://baseurl.com/")! }

    var method: HTTPMethod { .get }

    var headers: [String: String]? { nil }

    var parameters: [String: Any]? { nil }
}
