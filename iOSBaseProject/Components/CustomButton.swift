//
//  CustomButton.swift
//  iOSBaseProject
//
//  Created by Ibrahim on 4/22/24.
//

import SwiftUI

struct CustomButton: View {
        
    @State var action: () -> Void
    @State var imageIcon: Image?
    @State var title: String?
    @State var size: CGFloat = 18
    @State var height: CGFloat = 45
    @State var backgroundColor: Color = .accentColor
    @State var isCapsule: Bool = false
    
    var body: some View {
        HStack {
            Button(action: action, label: {
                HStack {

                    if let title {
                        Text(title)
                    }
                    
                    if let imageIcon {
                        imageIcon
                    }
                    
                }
                .padding([.leading, .trailing], 24)
            })
            .font(.system(size: size, weight: .bold, design: .default))
            .foregroundColor(.blackWhite)
            .frame(height: height)
            .background(backgroundColor)
            .clipShape(.rect(cornerRadius: isCapsule ? height/2 : height/5))
        }
    }
}

#Preview {
    Group {
        CustomButton(
            action: {},
            imageIcon: Image(.arrow),
            title: "Tap on me",
            height: 60,
            isCapsule: true
        )
        
        CustomButton(
            action: {},
            imageIcon: Image(systemName: "magnifyingglass"),
            title: "Search",
            height: 50,
            backgroundColor: .indigo
        )

        CustomButton(
            action: {},
            imageIcon: Image(systemName: "checkmark.seal.fill"),
            title: "Approved",
            height: 70
        )

        CustomButton(
            action: {},
            imageIcon: Image(systemName: "plus"),
            title: nil,
            height: 66,
            backgroundColor: .green,
            isCapsule: true
        )

    }
}
