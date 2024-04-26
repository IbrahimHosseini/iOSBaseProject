//
//  ContentView.swift
//  iOSBaseProject
//
//  Created by Ibrahim on 4/22/24.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var model: PostViewModel

    var body: some View {
        VStack {
            Text(model.posts.first?.title ?? "No data")
        }
        .onAppear(perform: {
            model.fetchPost()
        })
        .padding()
    }
}

#Preview {
    ContentView(
        model: PostViewModel(
            postService: PostServiceImp(network: URLSessionAPIClient<PostAPIs>.init())
        )
    )
}
