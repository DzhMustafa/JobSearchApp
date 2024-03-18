//
//  LikeButton.swift
//  JobSearch
//
//  Created by Джабраилов Мустафа on 16.03.2024.
//

import SwiftUI
import CoreData

struct LikeButton: View {
            
    let vacancy: VacancyElement
    
    @EnvironmentObject var vm: VacancyViewModel
    
    var body: some View {
        Button(action: {
            vm.like(id: vacancy.id)
        }) {
            Image(vm.favoriteVacancy.contains(vacancy) ? "heart.fill" : "favorite")
                .resizable()
                .frame(width: 24, height: 24)
        }
    }

}

//#Preview {
//    LikeButton(id: "", isFavorite: true)
//}
