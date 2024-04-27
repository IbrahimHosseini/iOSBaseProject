//
//  PostViewModel.swift
//  iOSBaseProject
//
//  Created by Ibrahim Hosseini on 4/27/24.
//

import Foundation
import Combine

@MainActor
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
