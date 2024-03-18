//
//  AppStateViewModel.swift
//  JobSearch
//
//  Created by Джабраилов Мустафа on 16.03.2024.
//

import Foundation
import SwiftUI

class AppStateViewModel: ObservableObject {
    @Published var currentTab: TabItem = .search
    
}
