//
//  PostService.swift
//  iOSBaseProject
//
//  Created by Ibrahim Hosseini on 4/27/24.
//

import Combine

/// Defining the methods for a service that handles post-related operations.
///
protocol PostService {
    /// Fetches a list of posts.

    ///  - Returns: A publisher that emits an array of `Post` objects upon success, or an error if the request fails.
    func getPost() -> AnyPublisher<[Post], Error>
}

/// Class implementing the `PostService` protocol. It uses a `URLSessionAPIClient` to make network requests.
///
class PostServiceImp: PostService {

    private let network: URLSessionAPIClient<PostAPIs>

    /// Initializes a `PostServiceImp` instance with a `URLSessionAPIClient` for making network requests.
    ///
    ///  - Parameter network: The `URLSessionAPIClient` instance used for making network requests.
    init(network: URLSessionAPIClient<PostAPIs>) {
        self.network = network
    }

    /// Fetches a list of posts using the `URLSessionAPIClient`.
    ///
    /// - Returns: A publisher that emits an array of `Post` objects upon success, or an error if the request fails.
    func getPost() -> AnyPublisher<[Post], Error> {
        return network.request(.posts)
    }

}
