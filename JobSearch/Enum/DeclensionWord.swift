//
//  DeclensionWord.swift
//  JobSearch
//
//  Created by Джабраилов Мустафа on 16.03.2024.
//

import Foundation

enum DeclensionWord {
    case human(Int)
    case vacancy(Int)
    
    var description: String {
        switch self {
            
        case .human(let number):
            switch number {
            case let x where x % 10 >= 2 && x % 10 <= 4:
                "\(number) человека"
            default:
                "\(number) человек"
            }
            
        case .vacancy(let number):
            switch number {
            case 1:
                "\(number) вакансия"
            default:
                "\(number) вакансии"
            }
            
        }
        
    }
}
