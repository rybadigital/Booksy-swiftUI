//
//  ApiRequest.swift
//  Booksy-swiftui
//
//  Created by Tomek Rybkowski on 18/12/2021.
//

import Foundation
import Combine

class ApiRequest {
    
    let baseURL = "https://api.openweathermap.org/data/2.5/"
    let apiKey = "&appid=ee5f8c6e819c87f19df157c1c0923ad8"
    
    func fetchCities(city: String) -> AnyPublisher<CityList, Error> {
        let endpoint = "find?q=\(city)&units=metric"
        let urlString = baseURL + endpoint + apiKey
        
        print(urlString)
        
        let url = URL(string: urlString)!// else {
//            return
//        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
        .map { $0.data }
        .decode(type: CityList.self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
    }
    
    func fetchForecastWeather(cityId: Int) -> AnyPublisher<ForecastWeather, Error> {
        let endpoint = "forecast?id=\(cityId)&units=metric"
        let urlString = baseURL + endpoint + apiKey
                        
        print(urlString)
        
        let url = URL(string: urlString)!// else {
//            return
//        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
        .map { $0.data }
        .decode(type: ForecastWeather.self, decoder: JSONDecoder())
        .eraseToAnyPublisher()
    }
}
