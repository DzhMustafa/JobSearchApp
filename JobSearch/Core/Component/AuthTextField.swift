//
//  AuthTextField.swift
//  JobSearch
//
//  Created by Джабраилов Мустафа on 15.03.2024.
//

import SwiftUI

struct AuthTextField: View {
    
    let placeholder: String
    
    let leftIconName: String
    
    @Binding var promtText: String?
    
    @Binding var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 8) {
                
                EmailTextField()
                
                Spacer()
                
                XmarkButton()
                
            }
            .padding(8)
            .frame(height: 40)
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.gray2)
            }
            .overlay {
                if promtText != nil {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke()
                        .fill(.lightRed)
                }
            }
            
            if let promtText {
                Text(promtText)
                    .font(.caption)
                    .foregroundStyle(.lightRed)
            }
        }
    }
    
    @ViewBuilder
    private func XmarkButton() -> some View {
        if !text.isEmpty {
            Button(action: { text.removeAll() }) {
                Image(.xmark)
                    .resizable()
                    .frame(width: 28, height: 28)
            }
        }
    }

    @ViewBuilder
    private func EmailTextField() -> some View {
        Image(leftIconName)
            .resizable()
            .frame(width: 24, height: 24)
        
        TextField(placeholder, text: $text)
            .font(.Text1)
            .keyboardType(.emailAddress)
    }
    
}

#Preview {
    AuthTextField(placeholder: "Электроная почта или телефон", leftIconName: "envelope", promtText: .constant(nil), text: .constant(""))
        .preferredColorScheme(.dark)
}

