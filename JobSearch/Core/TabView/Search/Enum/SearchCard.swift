//
//  SearchCard.swift
//  JobSearch
//
//  Created by Джабраилов Мустафа on 16.03.2024.
//

import Foundation

enum SearchCard: CaseIterable {
    case vacancyNearby, raiseResume, temporaryWork
    
    var iconName: String {
        switch self {
        case .vacancyNearby:
            "mark"
        case .raiseResume:
            "checkList"
        case .temporaryWork:
            "star"
        }
    }
    
    var title: String {
        switch self {
        case .vacancyNearby:
            "Вакансии\nрядом с вами"
        case .raiseResume:
            "Поднять резюме\nв поиске"
        case .temporaryWork:
            "Временная работа и\nподработка"
        }
    }
    
    var buttonTitle: String? {
        switch self {
        case .raiseResume:
            "Поднять"
        default:
            nil
        }
    }
}
