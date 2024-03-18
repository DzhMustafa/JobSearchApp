//
//  VacancyViewModel.swift
//  JobSearch
//
//  Created by Джабраилов Мустафа on 15.03.2024.
//

import Foundation
import Combine

final class VacancyViewModel: ObservableObject {
        
    @Published var vanacy: [VacancyElement] = []
        
    @Published var searchText: String = ""
    
    var favoriteVacancy: [VacancyElement] {
        vanacy.filter { $0.isFavorite }
    }
    
    private let service = APIService()
    
    private var cancellable: Set<AnyCancellable> = []
        
    init() {
        getVacancy()
    }
        
    private func getVacancy() {
         service.getVacancy()
            .receive(on: DispatchQueue.main)
            .sink { complition in
                switch complition {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] result in
                self?.vanacy = result.vacancies
            }
            .store(in: &cancellable)
    }
    
    func like(id: String) {
        guard let index = vanacy.firstIndex(where: { $0.id == id }) else { return }

        vanacy[index].like()
    }
}
