//
//  ContentView.swift
//  iOSBaseProject
//
//  Created by Ibrahim on 4/22/24.
//

import SwiftUI

struct ContentView: View {

    @StateObject var model: PostViewModel

    var body: some View {
        NavigationStack {
            List(model.posts, id: \.id) { post in
                HStack {
                    Text("\(post.userId)")
                    Text(post.title)
                }
            }
            .navigationTitle("Posts")
            .listStyle(.grouped)

            Button {
                model.fetchPost()
            } label: {
                Text("Fetch Data")
            }
        }

    }
}

#Preview {
    ContentView(
        model: PostViewModel(
            postService: PostServiceImp(network: URLSessionAPIClient<PostAPIs>.init())
        )
    )
}
