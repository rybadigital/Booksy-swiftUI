//
//  ForecastWeatherView.swift
//  Booksy-swiftui
//
//  Created by Tomek Rybkowski on 18/12/2021.
//

import SwiftUI

struct ForecastWeatherView: View {
    
    @ObservedObject var viewModel: ForecastWeatherViewModel
    
    init(viewModel: ForecastWeatherViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            if !viewModel.dataSource.isEmpty {
                forecastsSection
            }
        }
        .navigationBarTitle(Text(viewModel.city), displayMode: .inline)
    }
    
    
    
    var forecastsSection: some View {
        Section {
            ForEach(viewModel.dataSource) { viewModel in
                NavigationLink(destination: self.viewModel.goToScreenInformationForecastWeather(currentWeather: viewModel.currentWeather)) {
                    ForecastCell(viewModel: viewModel)
                }
            }
        }
    }
}
