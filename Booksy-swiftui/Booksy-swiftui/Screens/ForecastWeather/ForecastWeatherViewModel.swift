//
//  ForecastWeatherViewModel.swift
//  Booksy-swiftui
//
//  Created by Tomek Rybkowski on 18/12/2021.
//

import SwiftUI
import Combine

class ForecastWeatherViewModel: ObservableObject, Identifiable {
    
    @Published var dataSource: [ForecastCellViewModel] = []
    
    let city: String
    private let cityId: Int
    private var disposables = Set<AnyCancellable>()
    private let apiRequst = ApiRequest()
    
    init(cityId: Int, city: String) {
        self.cityId = cityId
        self.city = city
        fetchForecastWeather(cityId: cityId)
    }
    
    func goToScreenInformationForecastWeather(currentWeather: CurrentWeather) -> some View {
        let viewModel = CurrentWeatherViewModel(currentWeather: currentWeather, isCurrentWeather: false)
        
        return CurrentWeatherView(viewModel: viewModel)
    }
    
    func fetchForecastWeather(cityId: Int) {
        apiRequst.fetchForecastWeather(cityId: cityId)
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
                        ForecastCellViewModel(currentWeather: $0)} ?? []
                })
            .store(in: &disposables)
    }
}
