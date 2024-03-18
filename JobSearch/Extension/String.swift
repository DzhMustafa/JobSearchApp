//
//  String.swift
//  JobSearch
//
//  Created by Джабраилов Мустафа on 16.03.2024.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return self.prefix(1).capitalized + dropFirst()
    }
}
