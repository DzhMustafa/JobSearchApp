//
//  SignInViewModel.swift
//  JobSearch
//
//  Created by Джабраилов Мустафа on 15.03.2024.
//

import Foundation


class SignInViewModel: ObservableObject {
    
    @Published var email: String = ""
    
    @Published var promtText: String? = nil

    @Published var verifationCode = ""
    
     func checkEmailValidate() -> Bool {
        
        let emailPredicate = NSCompoundPredicate(format: "SELF MATCHES %@", Regex.email.rawValue)
        
        guard emailPredicate.evaluate(with: email) else {
            promtText = "Вы ввели неверный e-mail"
            return false
        }
        
        return true
    }
}
