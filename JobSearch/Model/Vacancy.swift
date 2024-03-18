//
//  Vacancy.swift
//  JobSearch
//
//  Created by Джабраилов Мустафа on 14.03.2024.
//

import Foundation

struct Vacancy: Codable {
    let offers: [Offer]
    let vacancies: [VacancyElement]
}

struct Offer: Codable {
    let id: String?
    let title: String
    let link: String
    let button: ButtonText?
}

struct ButtonText: Codable {
    let text: String
}

struct VacancyElement: Identifiable, Codable, Hashable {
    let id: String
    let lookingNumber: Int?
    let title: String
    let address: Address
    let company: String
    let experience: Experience
    let publishedDate: String
    var isFavorite: Bool
    let salary: Salary
    let schedules: [String]
    let appliedNumber: Int?
    let description: String?
    let responsibilities: String
    let questions: [String]
    
    mutating func like() {
        isFavorite.toggle()
    }
}

struct Address: Codable, Hashable {
    let town, street, house: String
}

struct Experience: Codable, Hashable {
    let previewText, text: String
}

struct Salary: Codable, Hashable {
    let full: String
    let short: String?
}
