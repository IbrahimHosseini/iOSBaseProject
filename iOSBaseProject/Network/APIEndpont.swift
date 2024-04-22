//
//  APIEndpont.swift
//  iOSBaseProject
//
//  Created by Ibrahim on 4/22/24.
//

import Foundation

protocol APIEndpont {
    
    /// base of API url
    var baseURL: URL { get }
    
    /// path of the endpoint API
    var path: String { get }
    
    /// set the HTTP method of API
    var method: HTTPMethod { get }
    
    /// set the heades for API
    var headers: [String: String]? { get }
    
    /// set the API parameters
    var parameters: [String: Any]? { get }
}

extension APIEndpont {
    
    /// set the base url from environment
    var baseURL: URL {
        URL(string: "http://baseurl.com/")!
    }
}
