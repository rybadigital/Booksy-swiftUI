//
//  CurrentWeatherView.swift
//  Booksy-swiftui
//
//  Created by Tomek Rybkowski on 18/12/2021.
//

import SwiftUI

struct CurrentWeatherView: View {
    
    @ObservedObject var viewModel: CurrentWeatherViewModel
    
    init(viewModel: CurrentWeatherViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {                
        if viewModel.isCurrentWeather {
            informationCityText
            
            forecastWeatherNavigationLink
                .navigationTitle(viewModel.titleScreen)
        } else {
            informationForecastWeatherText
                .navigationTitle(viewModel.titleScreen)
        }
    }
    
    var informationCityText: some View {
        VStack(alignment: .leading) {
            Text("City: \(viewModel.city)")
            Divider()
            Text("Country code: \(viewModel.countryCode)")
            Divider()
            Text("Temperature:  \( String(format: "%.1f", viewModel.temperature)) °C")
            Divider()
            Text("Main: \(viewModel.weatherMain)")
            Divider()
            Text("Description: \(viewModel.weatherDescription)")
            
            Spacer()
        }
        .padding(.top, 16)
        .padding(.leading, 16)
    }
    
    var informationForecastWeatherText: some View {
        VStack(alignment: .leading) {
            Text("Temperature:  \( String(format: "%.1f", viewModel.temperature)) °C")
            Divider()
            Text("Main: \(viewModel.weatherMain)")
            Divider()
            Text("Description: \(viewModel.weatherDescription)")
            Divider()
            Text("Date: \(viewModel.dateText)")
            
            Spacer()
        }
        .padding(.top, 16)
        .padding(.leading, 16)
    }
    
    var forecastWeatherNavigationLink: some View {
        NavigationLink(destination: self.viewModel.goToScreenForecastWeather()) {
            Text("Show forecast weather for \(viewModel.city)")
        }
    }
}
