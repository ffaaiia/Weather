//
//  DeatilView.swift
//  AWeatherApp
//
//  Created by Fay Anas Alshiban on 09/11/1443 AH.
//


import SwiftUI

struct DetailView: View {
    @StateObject var weatherVM: WeatherModelView
    
    var body: some View {
        if let current = weatherVM.current {
            Divider()
            VStack(alignment: .leading) {
                HStack {
                    VStack(alignment: .leading) {
                        CellDetail(title: "Sunrise", detail: "\(current.sunrise.hourMinuteAmPm(weatherVM.timeZoneOffset))")
                        CellDetail(title: "Pressure", detail: "\(current.pressure) hPa")
                        CellDetail(title: "Visibility", detail: "\(current.visibility/1000) Km")
                    }
                    Divider()
                    VStack(alignment: .leading) {
                        CellDetail(title: "Sunset", detail: "\(current.sunset.hourMinuteAmPm(weatherVM.timeZoneOffset))")
                        CellDetail(title: "Wind", detail: "\(current.windSpeedWithDirection)")
                        CellDetail(title: "UV Index", detail: current.uvi.roundedString(to: 0))
                    }
                }
            }.padding(.horizontal)
        }
    }
}
