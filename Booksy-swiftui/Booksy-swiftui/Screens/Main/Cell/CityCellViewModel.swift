//
//  CityCellViewModel.swift
//  Booksy-swiftui
//
//  Created by Tomek Rybkowski on 18/12/2021.
//

import Foundation
import SwiftUI

struct CityCellViewModel: Identifiable {
        
    let id: Int
    let currentWeather: CurrentWeather    
    let title: String
    let country: String
    
    init(currentWeather: CurrentWeather) {
        self.currentWeather = currentWeather
        
        id = currentWeather.id ?? 0
        title = currentWeather.name ?? ""
        country = currentWeather.sys?.country ?? ""
    }
}
