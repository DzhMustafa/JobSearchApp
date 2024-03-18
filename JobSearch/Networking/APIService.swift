//
//  APIService.swift
//  JobSearch
//
//  Created by Джабраилов Мустафа on 15.03.2024.
//

import Foundation
import Combine

final class APIService {
        
    func getVacancy() -> AnyPublisher<Vacancy, APIError> {
        guard let url = URL(string: "https://run.mocky.io/v3/ed41d10e-0c1f-4439-94fa-9702c9d95c14") else {
            return Fail(error: APIError.invalidURL).eraseToAnyPublisher()
        }
        
        return request(url: url)
    }
    
    private func request<T: Decodable>(url: URL) -> AnyPublisher<T, APIError> {
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response -> T in
                guard
                    let response = response as? HTTPURLResponse,
                    (200..<300).contains(response.statusCode)
                else {
                    throw APIError.failedRequest
                }
                
                /*
                                             Можно было бы декодиолвать через методификатор .decode(type: Vacancy.self, decoder: JSONDecoder())
                                             но в таком случае мы не сможем отловить ошибку декодирования так как мы возвращаем кастомную ошибку
                                        */
                do {
                    return try JSONDecoder().decode(T.self, from: data)
                } catch {
                    print("Unable to decode Responce: \(error.localizedDescription)")
                    throw APIError.invalidResponse
                }
            }
            .mapError { error -> APIError in
                switch error {
                case let apiError as APIError:
                    return apiError
                case URLError.notConnectedToInternet:
                    return APIError.unrechable
                default:
                    return APIError.failedRequest
                }
            }
            .eraseToAnyPublisher()
            
    }
    
}




