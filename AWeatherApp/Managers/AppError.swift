//
//  AppError.swift
//  AWeatherApp
//
//  Created by Fay Anas Alshiban on 09/11/1443 AH.
//

import Foundation
struct AppError: Identifiable {
    
    // MARK: - Properties
    let id = UUID().uuidString
    let errorString: String
}
