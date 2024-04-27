//
//  PostCell.swift
//  iOSBaseProject
//
//  Created by Ibrahim Hosseini on 4/28/24.
//

import SwiftUI

struct PostCell: View {
    @State var id: String = ""
    @State var title: String = ""

    var body: some View {
        HStack (alignment: .top, spacing: 16) {
            Rectangle()
                .overlay {
                    Text(id)
                        .font(.title)
                        .bold()
                        .foregroundStyle(Color.white)
                }
                .foregroundStyle(Color.orange)
                .frame(width: 60, height: 60)
                .clipShape(.circle)

            Text(title)
                .font(.system(size: 16))
                .fontWeight(.medium)
        }
    }
}

#Preview {
    PostCell(id: "100", title: "title")
}
