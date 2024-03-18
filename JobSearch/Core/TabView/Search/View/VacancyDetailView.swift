//
//  VacancyDetailView.swift
//  JobSearch
//
//  Created by Джабраилов Мустафа on 17.03.2024.
//

import SwiftUI

struct VacancyDetailView: View {
    
    let vacancy: VacancyElement
        
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                VacancyTitle(title: vacancy.title,
                             salary: vacancy.salary.full,
                             experience: vacancy.experience.previewText,
                             schedules: vacancy.schedules)
                
                NumberResponses(appiledNumber: vacancy.appliedNumber,
                                lookingNumber: vacancy.lookingNumber)
                .padding(.init(top: 13, leading: 0, bottom: 3, trailing: 0))

                AddressPreview(companyName: vacancy.company,
                               address: vacancy.address)
                
                VacancyDescription(description: vacancy.description,
                                   responsibilities: vacancy.responsibilities)
                
                VacancyQuestions(questions: vacancy.questions)
                
                ResponseButtom()
            }
            .padding()
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                HStack(spacing: 16) {
                    Button(action: { }) {
                        Image("eye")
                            .resizable()
                            .frame(width: 28, height: 28)
                    }
                    
                    Button(action: { }) {
                        Image("share")
                            .resizable()
                            .frame(width: 24, height: 24)
                    }
                    
                    LikeButton(vacancy: vacancy)
                }
            }
        }
    }
    
    private func VacancyTitle(title: String, salary: String, experience: String, schedules: [String]) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .font(.Title1)
            
            Text(salary)
                .font(.Text1)
            
            VStack(alignment: .leading, spacing: 6) {
                Text("Требуесый опыт: \(experience.dropFirst(4))")
                    
                HStack {
                    Text(schedules.joined(separator: ", ").capitalizingFirstLetter())
                }
            }
            .font(.Text1)
        }
    }
    
    private func NumberResponses(appiledNumber: Int?, lookingNumber: Int?) -> some View {
        HStack {
            if let appiledNumber {
                HStack(alignment: .top) {
                    Text("\(DeclensionWord.human(appiledNumber).description)\nуже откликнулось")
                    
                    Spacer()
                    
                    Image("person.circle")
                        .resizable()
                        .frame(width: 16, height: 16)

                }
                .padding(8)
                .frame(width: UIScreen.main.bounds.width / 2 - 20)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.darkGreen)
                }
                
            }
            
            if let lookingNumber {
                HStack(alignment: .top) {
                    Text("\(DeclensionWord.human(lookingNumber).description)\nсейчас смотрят")
                    
                    Spacer()
                    
                    Image("eye.circle")
                        .resizable()
                        .frame(width: 16, height: 16)
                }
                .padding(8)
                .frame(width: UIScreen.main.bounds.width / 2 - 20)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.darkGreen)
                }
            }
        }
        .font(.Text1)
        .foregroundColor(.white)
    }
    
    private func AddressPreview(companyName: String, address: Address) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            
            HStack {
                Text(companyName)
                    .font(.Title3)
                
                Image("checkmark")
                    .resizable()
                    .frame(width: 16, height: 16)
            }
            
            Image("map")
                .resizable()
                .scaledToFit()
            
            Text("\(address.town), \(address.street), \(address.house)")
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 8)
                .fill(.gray1)
        }
    }
    
    private func VacancyDescription(description: String?, responsibilities: String) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            if let description {
                Text(description)
                    .font(.Text1)
            }
            
            Text("Выши задачи")
                .font(.Title2)
            
            Text(responsibilities)
                .font(.Text1)
        }
    }
    
    private func VacancyQuestions(questions: [String]) -> some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Задайте вопрос работодателю")
                
                Text("Он получит его с откликом на вакансию")
                    .foregroundStyle(.gray3)
            }
            .font(.Title4)

            VStack(alignment: .leading, spacing: 8) {
                ForEach(questions, id: \.self) { question in
                    Text(question)
                        .padding(.init(top: 8, leading: 12, bottom: 8, trailing: 12))
                        .background {
                            Capsule()
                                .fill(.gray2)
                        }
                }
            }
        }
    }
    
    private func ResponseButtom() -> some View {
        Button(action: { }) {
            Text("Откликнуться")
                .font(.ButtonText1)
                .foregroundStyle(.myWhite)
                .frame(maxWidth: .infinity)
                .frame(height: 48)
                .background {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.lightGreen)
                }
        }
        
    }
}

#Preview {
    NavigationStack {
        VacancyDetailView(vacancy: VacancyElement(id: "cbf0c984-7c6c-4ada-82da-e29dc698bb50",
                                                  lookingNumber: 2,
                                                  title: "UI/UX дизайнер",
                                                  address: Address(town: "Минск", street: "улица Бирюзова", house: "4/5"),
                                                  company: "Мобирикс",
                                                  experience: Experience(previewText: "Опыт от 1 до 3 лет", text: "1–3 года"),
                                                  publishedDate: "2024-02-20",
                                                  isFavorite: true,
                                                  salary: Salary(full: "Уровень дохода не указан", short: nil),
                                                  schedules: ["полная занятость", "полный день"],
                                                  appliedNumber: 147,
                                                  description: "Мы ищем специалиста на позицию UX/UI Designer, который вместе с коллегами будет заниматься проектированием пользовательских интерфейсов внутренних и внешних продуктов компании.",
                                                  responsibilities: "- проектирование пользовательских сценариев и создание прототипов;\n- разработка интерфейсов для продуктов компании (Web+App);\n- работа над созданием и улучшением Дизайн-системы;\n- взаимодействие с командами frontend-разработки;\n- контроль качества внедрения дизайна;\n- ситуативно: создание презентаций и других материалов на основе фирменного стиля компании",
                                                  questions: ["Где располагается место работы?",
                                                              "Какой график работы?",
                                                              "Вакансия открыта?",
                                                              "Какая оплата труда?"]))
    }
    .preferredColorScheme(.dark)
}
