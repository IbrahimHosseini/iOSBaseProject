//
//  iOSBaseProjectApp.swift
//  iOSBaseProject
//
//  Created by Ibrahim on 4/22/24.
//

import SwiftUI

@main
struct iOSBaseProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(
                model: PostViewModel(
                    postService: PostServiceImp(
                        network: URLSessionAPIClient<PostAPIs>.init()
                    )
                )
            )
        }
    }
}
