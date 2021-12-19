//
//  MainViewModel.swift
//  Booksy-swiftui
//
//  Created by Tomek Rybkowski on 18/12/2021.
//

import SwiftUI
import Combine

class MainViewModel: ObservableObject, Identifiable {
    
    @Published var searchCity: String = ""
    @Published var dataSource: [CityCellViewModel] = []
    
    private var disposables = Set<AnyCancellable>()
    private var apiRequst = ApiRequest()
    
    init() {
        $searchCity
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.global())
            .sink(receiveValue: fetchWeather(city:))
            .store(in: &disposables)
    }
    
    func goToScreenCurrentWeather(currentWeather: CurrentWeather) -> some View {
        let viewModel = CurrentWeatherViewModel(currentWeather: currentWeather, isCurrentWeather: true)
        
        return CurrentWeatherView(viewModel: viewModel)
    }
    
    func fetchWeather(city: String) {
        if city.isEmpty {
            DispatchQueue.main.async {
                self.dataSource = []
            }
            
            return
        }
        
        apiRequst.fetchCities(city: city)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] value in
                    guard let weakSelf = self else { return }
                    switch value {
                    case .failure:
                        weakSelf.dataSource = []
                    case .finished:
                        break
                    }
                },
                receiveValue: { [weak self] forecast in
                    guard let weakSelf = self else { return }
                    weakSelf.dataSource = forecast.list?.map {
                        CityCellViewModel(currentWeather: $0)} ?? []
                })
            .store(in: &disposables)
    }
}
