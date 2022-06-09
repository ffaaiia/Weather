//
//  AWeatherAppApp.swift
//  AWeatherApp
//
//  Created by Fay Anas Alshiban on 09/11/1443 AH.
//

import SwiftUI

@main
struct AWeatherAppApp: App {
    var body: some Scene {
        WindowGroup {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.cyan , Color("light cyan")]), startPoint: .topLeading, endPoint: .bottomLeading).ignoresSafeArea()
            ContentView()
                }
            }
        }
    }

