//
//  CurrentView.swift
//  AWeatherApp
//
//  Created by Fay Anas Alshiban on 09/11/1443 AH.
//

import SwiftUI

struct CurrentView: View {
    @StateObject var weatherVM: WeatherModelView
    
    var body: some View {
        if let current = weatherVM.current {
            VStack(spacing: 2) {
                Text(weatherVM.currentCityName)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                HStack {
                    Text(current.weather[0].description.capitalized)
                    Divider()
                    Text("Feels Like: \(current.feels_like.roundedString(to: 0))°")
                }.fixedSize()
                HStack {
                    Text("\(current.temp.roundedString(to: 0))°")
                    Divider()
                    Image(systemName: current.weather[0].iconImage).renderingMode(.original)
                }.fixedSize().font(.system(size: 75)).padding()
                HStack {
                    Text("Cloud: \((current.clouds))%")
                    Divider()
                    Text("Humidity: \(current.humidity)%")
                }.fixedSize()
            }
        }
    }
}
