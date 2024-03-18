//
//  ContentView.swift
//  JobSearch
//
//  Created by Джабраилов Мустафа on 14.03.2024.
//

import SwiftUI

struct ContentView: View {
        
    @StateObject var appStateVM = AppStateViewModel()
    
    @EnvironmentObject var vacancyVM: VacancyViewModel
    
    init() {
        UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
    }
    
    var body: some View {
        TabView(selection: $appStateVM.currentTab) {
            
            SearchView()
            .tabItem {
                TabItemLabel(.search)
            }
            .tag(TabItem.search)
            
            FavoriteView()
            .tabItem {
                TabItemLabel(.favorite)
            }
            .tag(TabItem.favorite)
            .badge(vacancyVM.favoriteVacancy.count)

            VStack {
                
            }
            .tabItem {
                TabItemLabel(.feedback)
            }
            .tag(TabItem.feedback)
            
            VStack {
                
            }
            .tabItem {
                TabItemLabel(.message)
            }
            .tag(TabItem.message)
            
            SingInView()
            .tabItem {
                TabItemLabel(.profile)
            }
            .tag(TabItem.profile)
            
        }
        .environmentObject(appStateVM)
    }
    
    @ViewBuilder
    private func TabItemLabel(_ tabItem: TabItem) -> some View {
        Label(tabItem.title, image: appStateVM.currentTab == tabItem ? tabItem.iconName + ".fill": tabItem.iconName)
    }
}

#Preview {
    ContentView()
}

