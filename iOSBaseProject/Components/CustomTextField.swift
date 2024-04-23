//
//  CustomTextField.swift
//  iOSBaseProject
//
//  Created by Ibrahim on 4/23/24.
//

import SwiftUI

struct CustomTextField: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State var text: String = ""
    @State var colorStyle: Color = .blue
    @State var textColor: Color = .blackWhite
    @State var cornerRadius: CGFloat = 12.0
    @State var hasBackground: Bool = true
    @State var hasBorder: Bool = true
    @State var isSecureField: Bool = false
    @State var placeholder: String = "Placeholder"
    @State var height: CGFloat = 50.0
    
    var body: some View {
        if isSecureField {
            SecureField(
                text: $text,
                prompt: Text(placeholder)) {
                    
                }
                .padding()
                .foregroundStyle(textColor)
                .frame(height: height)
                .overlay {
                    if hasBorder {
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .stroke(colorStyle, lineWidth: 0.5)
                    }
                }
                .background {
                    if hasBackground {
                        colorStyle.clipShape(.rect(cornerRadius: cornerRadius)).opacity(0.15)
                    }
                }
                
                .padding()
        } else {
            TextField(
                text: $text,
                prompt: Text(placeholder)) {
                    
                }
                .padding()
                .foregroundStyle(textColor)
                .frame(height: height)
                .overlay {
                    if hasBorder {
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .stroke(colorStyle, lineWidth: 0.5)
                    }
                }
                .background {
                    if hasBackground {
                        colorStyle.clipShape(.rect(cornerRadius: cornerRadius)).opacity(0.15)
                    }
                }
                .frame(height: height)
                .padding()
        }
    }
}

#Preview {
    Group {
        CustomTextField()
        
        CustomTextField(
            text: "12345",
            colorStyle: .red,
            hasBackground: false,
            isSecureField: true
        )
        CustomTextField(
            colorStyle: .green,
            textColor: .blackWhite,
            cornerRadius: 35,
            hasBorder: false,
            placeholder: "First name",
            height: 70
        )
        
        CustomTextField(
            colorStyle: .black,
            textColor: .blue,
            hasBorder: false,
            placeholder: "Age",
            height: 40
        )
    }
}
