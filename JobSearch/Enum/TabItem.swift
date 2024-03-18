//
//  TabItem.swift
//  JobSearch
//
//  Created by Джабраилов Мустафа on 15.03.2024.
//

import Foundation

enum TabItem {
    case search, favorite, feedback, message, profile
    
    var iconName: String {
        switch self {
        case .search:
            "search"
        case .favorite:
            "favorite"
        case .feedback:
            "envelope"
        case .message:
            "message"
        case .profile:
            "profile" 
        }
    }
    
    var title: String {
        switch self {
        case .search:
            "Поиск"
        case .favorite:
            "Избранное"
        case .feedback:
            "Отклики"
        case .message:
            "Сообщения"
        case .profile:
            "Профиль"
        }
    }
}
