//
//  WeatherData.swift
//  AWeatherApp
//
//  Created by Fay Anas Alshiban on 09/11/1443 AH.
//

import Foundation

struct WeatherData: Codable {
    let timezone_offset: Int
    let current: Current
    let daily: [Daily]
    let hourly: [Hourly]
    
    // MARK: - Current Weather Model
    struct Current: Codable {
        let dt: Int
        let sunrise: Int
        let sunset: Int
        let temp: Double
        let feels_like: Double
        let pressure: Int
        let humidity: Int
        let uvi: Double
        let clouds: Int
        let visibility: Int
        let wind_speed: Double
        let wind_deg: Int
        let weather: [Weather]
    }
    
    // MARK: - Hourly Weather Model
    struct Hourly: Codable {
        let dt: Int
        let temp: Double
        let humidity: Int
        let clouds: Int
        let pop: Double
        let weather: [Weather]
    }
    
    // MARK: - Current Weather Model
    struct Daily: Codable {
        let dt: Int
        let temp: Temp
        let clouds: Int
        let humidity: Int
        let pop: Double
        let weather: [Weather]
        
        struct Temp: Codable {
            let min: Double
            let max: Double
        }
    }
    
    // MARK: - Sub Detail Model
    struct Weather: Codable {
        let description: String
        let icon: String
    }
}


extension WeatherData.Weather {
    var iconImage: String {
        switch icon {
        case "01d": return "sun.max.fill"
        case "01n": return "moon.stars.fill"
        case "02d": return "cloud.sun.fill"
        case "02n": return "cloud.moon.fill"
        case "03n", "03d": return "cloud.fill"
        case "04d", "04n": return "smoke.fill"
        case "09d", "09n": return "cloud.drizzle.fill"
        case "10d": return "cloud.sun.rain.fill"
        case "10n": return "cloud.moon.rain.fill"
        case "11d": return "cloud.sun.bolt.fill"
        case "11n": return "cloud.moon.bolt.fill"
        case "13d", "13n": return "snow"
        case "50d": return "sun.haze.fill"
        case "50n": return "cloud.fog.fill"
        default: return "cloud.fill"
        }
    }
}

// MARK: - Extension Current Data Model
extension WeatherData.Current {
    var windSpeedWithDirection: String {
        let windSpeed = "\((wind_speed * 3.6).roundedString(to: 1)) Km/h"
        switch wind_deg {
        case 0, 360: return "N \(windSpeed)"
        case 90: return "E \(windSpeed)"
        case 180: return "S \(windSpeed)"
        case 270: return "W \(windSpeed)"
        case 1..<90: return "NE \(windSpeed)"
        case 91..<180: return "SE \(windSpeed)"
        case 181..<270: return "SW \(windSpeed)"
        case 271..<360: return "NW \(windSpeed)"
        default: return windSpeed
        }
    }
}
