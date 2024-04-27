//
//  PostAPIs.swift
//  iOSBaseProject
//
//  Created by Ibrahim Hosseini on 4/26/24.
//

import Combine
import Foundation

enum PostAPIs: APIEndpoint {
    case getPosts

    var path: String {
        "posts"
    }
}
