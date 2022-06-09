//
//  ContentView.swift
//  AWeatherApp
//
//  Created by Fay Anas Alshiban on 09/11/1443 AH.
//

import SwiftUI



struct ContentView: View {
    

    @StateObject var weatherVM = WeatherModelView()
    

    var body: some View {

        if weatherVM.isLoading {
            ProgressView("Loading").font(.largeTitle)
        } else {
            ScrollView(showsIndicators: false) {
                
                VStack {
                    
                    SearchView(weatherVM: weatherVM)
                    CurrentView(weatherVM: weatherVM)
                    ScrollView(showsIndicators: false) {
                        DailyView(weatherVM: weatherVM)
                        HourlyView(weatherVM: weatherVM)
                        DetailView(weatherVM: weatherVM)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()    }
}
