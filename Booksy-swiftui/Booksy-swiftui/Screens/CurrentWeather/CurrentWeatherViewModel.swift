//
//  CurrentWeatherViewModel.swift
//  Booksy-swiftui
//
//  Created by Tomek Rybkowski on 18/12/2021.
//

import SwiftUI

class CurrentWeatherViewModel: ObservableObject, Identifiable {
        
    let currentWeather: CurrentWeather        
    
    let cityId: Int
    let city: String
    let countryCode: String
    let temperature: Double
    let weatherMain: String
    let weatherDescription: String
    let dateText: String
    
    let isCurrentWeather: Bool
    let titleScreen: String
    
    init(currentWeather: CurrentWeather, isCurrentWeather: Bool) {
        self.currentWeather = currentWeather
        
        cityId = currentWeather.id ?? 0
        city = currentWeather.name ?? ""
        countryCode = currentWeather.sys?.country ?? ""
        temperature = currentWeather.main?.temp ?? 0.0
        weatherMain = currentWeather.weather?.first?.main ?? ""
        weatherDescription = currentWeather.weather?.first?.description ?? ""
        dateText = currentWeather.dt_txt ?? ""
        
        self.isCurrentWeather = isCurrentWeather
        if isCurrentWeather {
            titleScreen = "Current weather"
        } else {
            titleScreen = "Forecast weather"
        }
    }
    
    func goToScreenForecastWeather() -> some View {
        let viewModel = ForecastWeatherViewModel(cityId: cityId, city: city)
        
        return ForecastWeatherView(viewModel: viewModel)
    }
}
