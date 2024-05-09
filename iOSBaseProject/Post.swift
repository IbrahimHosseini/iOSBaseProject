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
 *  This struct conforms to Codable protocol, which allows it to be easily
 **/
struct Post: Codable, Identifiable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
