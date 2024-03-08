//
//  WeatherViewModel.swift
//  Weather-App
//
//  Created by Álvaro Gascón on 5/3/24.
//

import Foundation

// https://api.openweathermap.org/data/2.5/weather?q=Castellón de la Plana&appid=be246867d5c3a2861f63fceb06fdefba&units=metric&lang=es

final class WeatherViewModel: ObservableObject {
    @Published var weatherModel: WeatherModel = .empty
    private let weatherModelMapper: WeatherModelMapper = WeatherModelMapper()
    
    func getWeather(city: String) async {
        let url = URL(string:"https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=be246867d5c3a2861f63fceb06fdefba&units=metric&lang=es")!
        
        do {
            async let (data, _) = try await URLSession.shared.data(from: url)
            let dataModel = try! await JSONDecoder().decode(WeatherResponseDataModel.self, from: data)
            
            DispatchQueue.main.async {
                self.weatherModel = self.weatherModelMapper.mapDataModelToModel(dataModel: dataModel)
            }
            
        } catch {
            print(error.localizedDescription)
        }
    }
}
