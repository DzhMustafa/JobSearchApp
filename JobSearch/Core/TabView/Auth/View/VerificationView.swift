//
//  VerificationView.swift
//  JobSearch
//
//  Created by Джабраилов Мустафа on 16.03.2024.
//

import SwiftUI

struct VerificationView: View {
    
    let email: String
    
    let numberOfFields: Int
    
    @EnvironmentObject var appStateVM: AppStateViewModel
    
    @FocusState private var fieldFocus: Int?
    
    @State var enterValue: [String]
    
    @State var oldValue = ""
    
    var isDisabled: Bool {
        enterValue.allSatisfy { !$0.isEmpty }
    }
    
    init(email: String,numberOfFields: Int) {
        self.email = email
        self.numberOfFields = numberOfFields
        self.enterValue = Array(repeating: "", count: numberOfFields)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Отправили код на \(email)")
                .font(.Title2)
            
            Text("Напишите его, чтобы подтвердить, что это вы, а не кто-то другой входит в личный кабинет")
                .font(.Title3)
            
            VerifyField()
            
            Button(action: { appStateVM.currentTab = .search }) {
                Text("Подтвердить")
                    .foregroundStyle(!isDisabled ? .gray4 : .white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                    .background {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(!isDisabled ? .darkBlue : .lightBlue)
                    }
            }
            .disabled(!isDisabled)
            
        }
        .padding(12)
        .onAppear {
            fieldFocus = 0
        }
    }
    
    private func VerifyField() -> some View {
        HStack(spacing: 10) {
            ForEach(0..<numberOfFields, id: \.self) { index in
                TextField("*", text: $enterValue[index], onEditingChanged: { editing in
                    if editing {
                        oldValue = enterValue[index]
                    }
                })
                .keyboardType(.numberPad)
                .frame(width: 48, height: 48)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.gray2)
                }
                .multilineTextAlignment(.center)
                .focused($fieldFocus, equals: index)
                .tag(index)
                .onChange(of: enterValue[index]) { newValue in
                    if !newValue.isEmpty {

                        if enterValue[index].count > 1 {
                            let currentValue = Array(enterValue[index])
 
                            if currentValue[0] == Character(oldValue) {
                                enterValue[index] = String(enterValue[index].suffix(1))
                            } else {
                                enterValue[index] = String(enterValue[index].prefix(1))
                            }
                        }
                        
                        if index == numberOfFields - 1 {
                            fieldFocus = nil
                        } else {
                            fieldFocus = (fieldFocus ?? 0) + 1
                        }
                    } else {
                        fieldFocus = (fieldFocus ?? 0) - 1
                    }
                }
            }
        }
    }
}

#Preview {
    VerificationView(email: "example@mail.com",numberOfFields: 4)
        .preferredColorScheme(.dark)
}
