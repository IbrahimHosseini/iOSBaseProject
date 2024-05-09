//
//  PostAPIs.swift
//  iOSBaseProject
//
//  Created by Ibrahim Hosseini on 4/26/24.
//

import Combine
import Foundation

/// PostAPIs enum represents the different types of API requests related to posts.
enum PostAPIs: APIEndpoint {
    /// getPosts is a case of the PostAPIs enum, representing a request to fetch all posts.
    case getPosts

    /// The path property returns the path for the corresponding API request.
    ///
    ///  - Returns: The path for the API request.
    var path: String {
        "posts"
    }
}
