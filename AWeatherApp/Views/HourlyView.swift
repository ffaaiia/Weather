//
//  HourlyView.swift
//  AWeatherApp
//
//  Created by Fay Anas Alshiban on 09/11/1443 AH.
//

import SwiftUI


struct HourlyView: View {
    @StateObject var weatherVM: WeatherModelView
    
    var body: some View {
        if let hourly = weatherVM.hourly {
            Divider()
            VStack(alignment: .leading) {
                Text("Hourly Forecast").bold()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(hourly, id: \.dt) { hour in
                            ZStack {
                                VStack {
                                    Text(hour.dt.hourMinuteAmPm(weatherVM.timeZoneOffset)).font(.title)
                                    HStack {
                                        Text("\(hour.temp.roundedString(to: 0))°")
                                        Divider()
                                        Image(systemName: hour.weather[0].iconImage).renderingMode(.original)
                                    }
                                    .font(.system(size: 24))
                                    .padding()
                                    HStack {
                                        Text("Rain: \((hour.pop * 100).roundedString(to: 0))%")
                                        Divider()
                                        Text("Cloud: \(hour.clouds)%")
                                    }
                                }.padding()
                            }
                            .background(Color(.systemBlue).opacity(0.25))
                            .cornerRadius(12)
                        }
                    }
                }
            }.padding(.horizontal, 8)
        }
    }
}
