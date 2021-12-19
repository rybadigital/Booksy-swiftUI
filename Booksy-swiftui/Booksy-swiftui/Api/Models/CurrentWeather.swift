//
//  CurrentWeather.swift
//  Booksy-swiftui
//
//  Created by Tomek Rybkowski on 18/12/2021.
//

import Foundation

struct CurrentWeather: Codable {
    
    let id: Int?
    let name: String?
    let sys: Sys?
    let main: Temperature?
    let weather: [Weather]?
    let coord: Coord?
    let dt_txt: String?
}
