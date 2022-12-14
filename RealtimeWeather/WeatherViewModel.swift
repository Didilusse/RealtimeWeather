//
//  WeatherViewModel.swift
//  RealtimeWeather
//
//  Created by Adil Rahm on 8/19/22.
//

import Foundation

private let defaultIcon = "đĨļ"
private let iconMap = [
  "Drizzle" : "đ§",
  "Thunderstorm" : "â",
  "Rain": "đ§",
  "Snow": "âī¸",
  "Clear": "âī¸",
  "Clouds" : "âī¸",
]

class WeatherViewModel: ObservableObject {
  @Published var cityName: String = "City Name"
  @Published var temperature: String = "--"
  @Published var weatherDescription: String = "--"
  @Published var weatherIcon: String = defaultIcon
  @Published var shouldShowLocationError: Bool = false

  public let weatherService: WeatherService

  init(weatherService: WeatherService) {
    self.weatherService = weatherService
  }

  func refresh() {
    weatherService.loadWeatherData { weather, error in
      DispatchQueue.main.async {
        if let _ = error {
          self.shouldShowLocationError = true
          return
        }

        self.shouldShowLocationError = false
        guard let weather = weather else { return }
        self.cityName = weather.city
        self.temperature = "\(weather.temperature)ÂēC"
        self.weatherDescription = weather.description.capitalized
        self.weatherIcon = iconMap[weather.iconName] ?? defaultIcon
      }
    }
  }
}
