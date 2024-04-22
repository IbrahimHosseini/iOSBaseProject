//
//  CustomButton.swift
//  iOSBaseProject
//
//  Created by Ibrahim on 4/22/24.
//

import SwiftUI

struct CustomButton: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var action: () -> Void
    @State var icon: ImageResource?
    @State var title: String?
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
                    
                    if let icon {
                        Image(icon)
                    }
                    
                }
                .padding()
            })
            .font(
                .system(
                    size: 18,
                    weight: .bold,
                    design: .default
                )
            )
            .foregroundColor(.primary)
            .frame(height: height)
            .background(backgroundColor)
            .clipShape(.capsule)
        }
    }
}

#Preview {
    Group {
        CustomButton(
            action: {},
            icon: .arrow,
            title: "Tap on me",
            height: 50
        )
        .environment(\.colorScheme, .dark)
        
        CustomButton(
            action: {},
            icon: .arrow,
            title: "Tap on me"
        )
        .environment(\.colorScheme, .light)
        
    }
}
