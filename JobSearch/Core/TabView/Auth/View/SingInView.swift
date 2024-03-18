//
//  SingInView.swift
//  JobSearch
//
//  Created by Джабраилов Мустафа on 15.03.2024.
//

import SwiftUI

struct SingInView: View {
    
    @StateObject var vm = SignInViewModel()
    
    @State private var path: [String] = []

    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Text("Вход в личный кабинет")
                    .font(.Title2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                AuthForm()
                
                EmployeeSearchForm()
                
                Spacer()
                
            }
            .padding()
            .onChange(of: vm.email) { _ in
                if vm.promtText != nil {
                    vm.promtText = nil
                }
            }
            .navigationDestination(for: String.self) { value in
                VerificationView(email: value, numberOfFields: 4)
            }
        }
    }
    
    private func AuthForm() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            
            Text("Поиск работы")
                .font(.Title3)
            
            AuthTextField(placeholder: "Электронная почта", leftIconName: "envelope", promtText: $vm.promtText, text: $vm.email)
            
            HStack {
                СontinueButton()
                
                LoginWithPasswordButton()
            }
        }
        .padding(EdgeInsets(top: 24, leading: 16, bottom: 24, trailing: 16))
        .background  {
            RoundedRectangle(cornerRadius: 8)
                .fill(.gray1)
        }
    }
        
    private func EmployeeSearchForm() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Поиск сотрудника")
                    .font(.Title3)
                
                Text("Размещение вакансий и доступ к базе резюме")
                    .font(.Text1)
            }
            
            Button(action: { }) {
                Text("Я ищу сотрудника")
                    .font(.ButtonText2)
                    .foregroundStyle(.myWhite)
                    .frame(maxWidth: .infinity)
                    .frame(height: 32)
                    .background(Color.lightGreen)
                    .clipShape(Capsule())
            }
            
        }
        .padding(EdgeInsets(top: 24, leading: 16, bottom: 24, trailing: 16))
        .background {
            RoundedRectangle(cornerRadius: 8)
                .fill(.gray1)
        }
    }
}

extension SingInView {
    private func СontinueButton() -> some View {
        Button(action: {
            guard vm.checkEmailValidate() else { return }
            
            path.append(vm.email)
        }) {
            Text("Продолжить")
                .font(.ButtonText2)
                .foregroundStyle(vm.email.isEmpty ? .gray4 : .myWhite)
                .frame(maxWidth: .infinity)
                .frame(height: 40)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(vm.email.isEmpty ? .darkBlue : .lightBlue)
                }
        }
        .disabled(vm.email.isEmpty)
    }
    
    private func LoginWithPasswordButton() -> some View {
        Button(action: { }) {
            Text("Войти с паролем")
                .font(.ButtonText2)
                .foregroundStyle(.lightBlue)
                .frame(maxWidth: .infinity)

        }
    }
}
#Preview {
    SingInView()
        .preferredColorScheme(.dark)
}
