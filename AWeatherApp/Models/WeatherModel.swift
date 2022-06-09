//
//  WeatherModel.swift
//  AWeatherApp
//
//  Created by Fay Anas Alshiban on 09/11/1443 AH.
//

import Foundation
struct WeatherModel{
    
    let codationId: Int
    let CityName: String
    let temp: Double
    let   feels_like: Double
    let   temp_min: Double
    let   temp_max: Double
    let   pressure: Double
    let   humidity: Double

    
    var condationName: String {
        
        switch codationId{
        case 200...232:
            return "cloud.bolt.fill"
        case 300...321:
            return "cloud.drizzle.fill"
            
        case 500...531:
            return "cloud.rain.fill"
        case 600...622:
            return "cloud.snow.fill"
        case 701...781:
            return "cloud.fog.fill"
            
        case 800...884:
            return "cloud.max.fill"

            
        default:
            return ""
        }
        
       
        
        
    }

//
//    static var `default` : WeatherModel = .init(
//        codationId: 600,
//        CityName: "",
//        temp: 8
//
//
//
//    )
        static var `default` : WeatherModel = .init(
            codationId: 600,
            CityName: "",
            temp: 8,
            feels_like: 281.86,
              temp_min: 280.37,
              temp_max: 284.26,
              pressure: 1023,
            humidity: 100
         
    
    
    
        )

    }
