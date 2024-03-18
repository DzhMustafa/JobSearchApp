//
//  APIError.swift
//  JobSearch
//
//  Created by Джабраилов Мустафа on 15.03.2024.
//

import Foundation

enum APIError: LocalizedError {
    case failedRequest
    case unrechable
    case invalidResponse
    case invalidURL
}
