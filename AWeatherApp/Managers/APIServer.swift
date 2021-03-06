//
//  APIServer.swift
//  AWeatherApp
//
//  Created by Fay Anas Alshiban on 09/11/1443 AH.
//

import Foundation
struct APIService {
    
    // MARK: - Property
    static let shared = APIService()
    
    // MARK: - API Error Enumeration
    enum APIError: Error {
        case error(_ errorString: String)
    }
    
    // MARK: - Fetching and Decoding JSON Data
    func getJSON<T: Decodable>(urlString: String,
                               dateDecodingStrategy: JSONDecoder.DateDecodingStrategy = .secondsSince1970,
                               keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy = .useDefaultKeys,
                               completion: @escaping (Result<T, APIError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(.failure(.error(NSLocalizedString("Error: Invalid URL", comment: "Local Language"))))
            return
        }
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                completion(.failure(.error("mansaError: \(error.localizedDescription)")))
                return
            }
            
            guard let data = data else {
                completion(.failure(.error(NSLocalizedString("Error: Data is currupt", comment: "Local Language"))))
                return
            }
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = dateDecodingStrategy
            decoder.keyDecodingStrategy = keyDecodingStrategy
            do {
                let decodedData = try decoder.decode(T.self, from: data)
                completion(.success(decodedData))
            } catch let decodingError {
                completion(.failure(APIError.error("mansaDecodingError: \(decodingError.localizedDescription)")))
            }
            
        }.resume()
    }
}
