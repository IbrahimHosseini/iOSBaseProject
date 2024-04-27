//
//  PostService.swift
//  iOSBaseProject
//
//  Created by Ibrahim Hosseini on 4/27/24.
//

import Combine

protocol PostService {
    func getPost() -> AnyPublisher<[Post], Error>
}

class PostServiceImp: PostService {

    private let network: URLSessionAPIClient<PostAPIs>

    init(network: URLSessionAPIClient<PostAPIs>) {
        self.network = network
    }

    func getPost() -> AnyPublisher<[Post], Error> {
        network.request(PostAPIs.getPosts)
    }

}
