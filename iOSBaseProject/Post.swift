//
//  Post.swift
//  iOSBaseProject
//
//  Created by Ibrahim Hosseini on 4/27/24.
//

import Foundation

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
