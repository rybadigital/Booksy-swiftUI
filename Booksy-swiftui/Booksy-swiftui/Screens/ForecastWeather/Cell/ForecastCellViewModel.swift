//
//  ForecastCellViewModel.swift
//  Booksy-swiftui
//
//  Created by Tomek Rybkowski on 19/12/2021.
//

import Foundation
import SwiftUI

struct ForecastCellViewModel: Identifiable {
        
    let id: UUID = UUID()
    let currentWeather: CurrentWeather
    let temperature: Double
    let weatherMain: String
    let weatherDescription: String
    let dateText: String
    
    init(currentWeather: CurrentWeather) {
        self.currentWeather = currentWeather
        
        temperature = currentWeather.main?.temp ?? 0.0
        weatherMain = currentWeather.weather?.first?.main ?? ""
        weatherDescription = currentWeather.weather?.first?.description ?? ""
        dateText = currentWeather.dt_txt ?? ""
    }
}
