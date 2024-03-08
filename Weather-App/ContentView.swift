//
//  ContentView.swift
//  Weather-App
//
//  Created by Álvaro Gascón on 5/3/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var weatherViewModel = WeatherViewModel()
    @State private var searchCity = ""
    
    var body: some View {
        ZStack {
            VStack{
                TextField("Buscar ciudad...", text: $searchCity, onCommit: {
                    Task {
                        await weatherViewModel.getWeather(city: searchCity)
                        searchCity = ""
                    }
                })
                .foregroundStyle(.black)
                .foregroundColor(.white)
                .font(.headline)
                .padding(.vertical, 5)
                .padding(.leading, 10)
                .background(Color.white)
                .cornerRadius(25)
                .padding(.horizontal, 50)

                
                Text(weatherViewModel.weatherModel.city)
                    .foregroundStyle(.white)
                    .font(.system(size: 70))
                    .multilineTextAlignment(.center)
                Text(weatherViewModel.weatherModel.description)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.bottom, 8)
                HStack {
                    if let url = weatherViewModel.weatherModel.iconURL {
                        AsyncImage(url: url) { image in
                            image
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    Text(weatherViewModel.weatherModel.currentTemperature)
                        .font(.system(size: 70))
                        .foregroundColor(.white)
                }
                .padding(.top, 20)
                HStack(spacing: 14) {
                        Label(weatherViewModel.weatherModel.maxTemperature, systemImage: "thermometer.sun.fill")
                    Label(weatherViewModel.weatherModel.minTemperature, systemImage: "thermometer.snowflake")
                }
                .symbolRenderingMode(.multicolor)
                .foregroundColor(.white)
                Divider()
                    .foregroundColor(.white)
                    .padding()
                HStack(spacing: 32) {
                    VStack{
                        Image(systemName: "sunrise.fill")
                            .symbolRenderingMode(.multicolor)
                        Text(weatherViewModel.weatherModel.sunrise, style: .time)
                    }
                    VStack{
                        Image(systemName: "sunset.fill")
                            .symbolRenderingMode(.multicolor)
                        Text(weatherViewModel.weatherModel.sunset, style: .time)
                    }
                }
                .foregroundColor(.white)
                Divider()
                    .foregroundColor(.white)
                    .padding()
                Label(weatherViewModel.weatherModel.humidity, systemImage: "humidity.fill")
                    .symbolRenderingMode(.multicolor)
                    .foregroundColor(.white)
                Spacer()
            }
            .padding(.top, 32)
        }
        .background(
            LinearGradient(colors: [.blue, .green], startPoint: .topLeading, endPoint: .bottomTrailing)
        )
                
        }
        
    }


#Preview {
    ContentView()
}
