//
//  WeatherModel.swift
//  Weather-App
//
//  Created by Álvaro Gascón on 5/3/24.
//

import Foundation

struct WeatherModel {
    let city: String
    let weather: String
    let description: String
    let iconURL: URL?
    let currentTemperature: String
    let minTemperature: String
    let maxTemperature: String
    let humidity: String
    let sunset: Date
    let sunrise: Date
    
    static let empty: WeatherModel = .init(
        city: "-",
        weather: "-",
        description: "-",
        iconURL: nil,
        currentTemperature: "-º",
        minTemperature: "-º Min.",
        maxTemperature: "-º Máx",
        humidity: "-%",
        sunset: .now,
        sunrise: .now)
}
