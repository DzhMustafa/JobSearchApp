//
//  JobSearchApp.swift
//  JobSearch
//
//  Created by Джабраилов Мустафа on 14.03.2024.
//

import SwiftUI
import CoreData

@main
struct JobSearchApp: App {
    
    @StateObject var vacancyViewModel = VacancyViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .preferredColorScheme(.dark)
                .environmentObject(vacancyViewModel)
        }
    }
}
