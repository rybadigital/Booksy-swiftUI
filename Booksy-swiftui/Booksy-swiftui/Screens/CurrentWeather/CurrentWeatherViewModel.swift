//
//  CurrentWeatherViewModel.swift
//  Booksy-swiftui
//
//  Created by Tomek Rybkowski on 18/12/2021.
//

import SwiftUI

class CurrentWeatherViewModel: ObservableObject, Identifiable {
        
    let currentWeather: CurrentWeather        
    
    let city: String
    let countryCode: String
    let temperature: Double
    let weatherMain: String
    let weatherDescription: String
    
    init(currentWeather: CurrentWeather) {
        self.currentWeather = currentWeather
        
        city = currentWeather.name ?? ""
        countryCode = currentWeather.sys?.country ?? ""
        temperature = currentWeather.main?.temp ?? 0.0
        weatherMain = currentWeather.weather?.first?.main ?? ""
        weatherDescription = currentWeather.weather?.first?.description ?? ""
    }
    
    func goToScreenCurrentWeather() -> some View {
        let viewModel = CurrentWeatherViewModel(currentWeather: currentWeather)
        
        return CurrentWeatherView(viewModel: viewModel)
    }
}
