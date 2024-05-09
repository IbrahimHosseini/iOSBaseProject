//
//  PostViewModel.swift
//  iOSBaseProject
//
//  Created by Ibrahim Hosseini on 4/27/24.
//

import Foundation
import Combine

/// PostViewModel class is responsible for managing the data related to posts.
///  It uses Combine framework to handle asynchronous data fetching and updates.
class PostViewModel: ObservableObject {
    
    /// A published property that holds the error message if any error occurs during data fetching.
    @Published var error: String?
    
    /// A published property that holds the array of Post objects.
    @Published private(set) var posts = [Post]()

    /// A set that holds the cancellable objects.
    private var cancellable = Set<AnyCancellable>()

    /// A dependency injection of PostService instance.
    private var postService: PostService

    /// Initializes the PostViewModel instance with the provided PostService instance.
    ///
    ///  - Parameter postService: An instance of PostService class.
    init(postService: PostService) {
        self.postService = postService
    }

    /// Fetches the posts from the server and updates the `posts` property.
    @MainActor
    func fetchPost() {
        // Fetches the posts from the server using the postService instance.
        postService.getPost()
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { error in
                print(error)
            }, receiveValue: { posts in
                
                // Updates the `posts` property with the received posts.
                self.posts = posts
            })
            .store(in: &cancellable)
    }
}
