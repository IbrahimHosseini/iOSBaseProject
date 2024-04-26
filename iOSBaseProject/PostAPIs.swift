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

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

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

class PostViewModel: ObservableObject {
    @Published var error: String?
    @Published private(set) var posts = [Post]()

    private var cancellable = Set<AnyCancellable>()

    private var postService: PostService

    init(postService: PostService) {
        self.postService = postService
    }

    func fetchPost() {
        postService.getPost()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { error in
                print(error)
            }, receiveValue: { posts in
                self.posts = posts
            })
            .store(in: &cancellable)
    }
}
