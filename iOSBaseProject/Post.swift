//
//  Post.swift
//  iOSBaseProject
//
//  Created by Ibrahim Hosseini on 4/27/24.
//

import Foundation

/**
 *  Post struct represents a single post in the application.
 *
 *  This struct conforms to Codable protocol, which allows it to be easily serialized and deserialized.
 *  It also conforms to Identifiable protocol, which provides a unique identifier for each instance.
 *
 *  - userId: The unique identifier of the user who created the post.
 *  - id: The unique identifier of the post.
 *  - title: The title of the post.
 *  - body: The content of the post.
 */
struct Post: Codable, Identifiable {
    /**
     *  The unique identifier of the user who created the post.
     */
    let userId: Int

    /**
     *  The unique identifier of the post.
     */
    let id: Int

    /**
     *  The title of the post.
     */
    let title: String

    /**
     *  The content of the post.
     */
    let body: String
}