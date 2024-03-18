//
//  SearchView.swift
//  JobSearch
//
//  Created by Джабраилов Мустафа on 15.03.2024.
//

import SwiftUI

struct SearchView: View {
    
    @EnvironmentObject var vm: VacancyViewModel
            
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    FilterMofier()
                    
                    SearchCards()
                    
                    VacanciesList()
                    
                    MoreButton()
                }
            }
        }
        
    }
    
    private func FilterMofier() -> some View {
        HStack {
            HStack {
                Image("search")
                    .resizable()
                    .frame(width: 24, height: 24)
                
                TextField("Должность, ключевые слова", text: $vm.searchText)
            }
            .padding(8)
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.gray2)
            }
            
            Image("slider")
                .resizable()
                .frame(width: 16, height: 14)
                .frame(width: 40, height: 40)
                .background {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.gray2)
                }
        }
        .padding()
    }
    private func SearchCards() -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 9) {
                ForEach(SearchCard.allCases, id: \.self) { value in
                    VStack(alignment: .leading) {
                        Image(value.iconName)
                            .padding(.bottom, 12)
                        
                        Text(value.title)
                            .font(.Title4)
                        
                        if let text = value.buttonTitle {
                            Button(action: { }) {
                                Text(text)
                                    .font(.caption)
                                    .foregroundStyle(.lightGreen)
                            }
                        }
                        Spacer(minLength: 0)
                    }
                    .padding(EdgeInsets(top: 10, leading: 8, bottom: 8, trailing: 7))
                    .frame(width: 132, height: 120, alignment: .leading)
                    .background {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.gray1)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    private func VacanciesList() -> some View {
        VStack {
            Text("Вакансии для вас")
                .font(.Title1)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ForEach(vm.vanacy.prefix(3)) { value in
                VacancyCardView(vacancy: value)
            }
        }
        .padding()
    }
    
    @ViewBuilder
    private func MoreButton() -> some View {
        if !vm.vanacy.isEmpty {
            Button(action: { }) {
                Text("Еще \(DeclensionWord.vacancy(vm.vanacy.count).description)")
                    .font(.ButtonText1)
                    .foregroundStyle(.myWhite)
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                    .background {
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.lightBlue)
                    }
            }
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
        }
    }
}

//#Preview {
//    SearchView()
//        .preferredColorScheme(.dark)
//}
