//
//  RealtimeWeatherApp.swift
//  RealtimeWeather
//
//  Created by Adil Rahm on 8/19/22.
//

import SwiftUI

@main
struct RealtimeWeatherApp: App {
    var body: some Scene {
        WindowGroup {
            let weatherService = WeatherService()
            WeatherView(viewModel: WeatherViewModel(weatherService: weatherService))
        }
    }
}
