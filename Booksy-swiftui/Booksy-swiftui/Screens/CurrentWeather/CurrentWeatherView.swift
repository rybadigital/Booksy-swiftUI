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
        informationCityText
        
        forecastWeatherNavigationLink
            .navigationTitle("Current weather")
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
    
    
    var forecastWeatherNavigationLink: some View {
        NavigationLink(destination: self.viewModel.goToScreenCurrentWeather()) {
            Text("Show forecast weather for \(viewModel.city)")
                .padding(.top, 55)
        }
        .padding(.top, 32)
    }
}
