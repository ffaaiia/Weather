//
//  SearchView.swift
//  AWeatherApp
//
//  Created by Fay Anas Alshiban on 09/11/1443 AH.
//

import SwiftUI

import SwiftUI
struct SearchView: View {
    @StateObject var weatherVM: WeatherModelView
    
    var body: some View {
        HStack {
            Button {
                weatherVM.getWeather()
            } label: {
                Image(systemName: "location.circle.fill").renderingMode(.original)
                    .font(.system(size: 24))
            }
            
            TextField("Search City", text: $weatherVM.searchedCityName, onCommit:  {
                weatherVM.fetchWeatherByCityName()
            })
            .padding(5)
            .background(Color(.quaternarySystemFill))
            .cornerRadius(8)
            Button {
                weatherVM.fetchWeatherByCityName()
            } label: {
                Image(systemName: "magnifyingglass").renderingMode(.original)
                    .font(.system(size: 24))
            }
        }
        .padding(.horizontal)
    }
}
