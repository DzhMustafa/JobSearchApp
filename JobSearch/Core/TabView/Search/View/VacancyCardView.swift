//
//  VacancyCardView.swift
//  JobSearch
//
//  Created by Джабраилов Мустафа on 16.03.2024.
//

import SwiftUI

struct VacancyCardView: View {
    
    let vacancy: VacancyElement
    
    @EnvironmentObject var vm: VacancyViewModel
    
    var body: some View {
        NavigationLink(destination: {
            VacancyDetailView(vacancy: vacancy)
        }) {
            Card()
        }
    }
    
    private func Card() -> some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Сейчас просматривает \(DeclensionWord.human(vacancy.lookingNumber ?? 0).description)")
                    .font(.Text1)
                    .foregroundStyle(.lightGreen)
                
                Spacer()
                
                LikeButton(vacancy: vacancy)
                
            }
            
            Text(vacancy.title)
                .font(.Title3)
                .multilineTextAlignment(.leading)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(vacancy.address.town)
                
                HStack(spacing: 8) {
                    Text(vacancy.company)
                    
                    Image("checkmark")
                        .resizable()
                        .frame(width: 16, height: 16)
                }
            }
            .font(.Text1)
            
            HStack(spacing: 8) {
                Image("briefcase")
                    .resizable()
                    .frame(width: 16, height: 16)
                Text(vacancy.experience.previewText)
            }
            
            Button(action: { }) {
                Text("Откликнуться")
                    .foregroundStyle(.myWhite)
                    .frame(maxWidth: .infinity)
                    .frame(height: 32)
                    .background {
                        Capsule()
                            .fill(.lightGreen)
                    }
            }
            .padding(.top)
        }
        .padding()
        .foregroundStyle(.white)
        .background {
            RoundedRectangle(cornerRadius: 8)
                .fill(.gray1)
        }
    }
}


