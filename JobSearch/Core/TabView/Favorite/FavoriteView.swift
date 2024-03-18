//
//  FavoriteView.swift
//  JobSearch
//
//  Created by Джабраилов Мустафа on 17.03.2024.
//

import SwiftUI

struct FavoriteView: View {
    
    @EnvironmentObject var vm: VacancyViewModel

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text(DeclensionWord.vacancy(vm.favoriteVacancy.count).description)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    ForEach(vm.favoriteVacancy) { vacancy in
                        VacancyCardView(vacancy: vacancy)
                    }
                }
                .padding()
            }
            .navigationTitle("Избранное")
        }
    }
}

//#Preview {
//    FavoriteView()
//}
