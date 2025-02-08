//
//  APIManager.swift
//  EshopApp
//
//  Created by Monis Manzoor on 06/02/25.
//

import Foundation

enum NetworkError : Error {
    case invalidResponse
    case invalidURL
}

class APIManager {
    
    func getData<T : Decodable>(FromServer urlString : String) async throws -> T {
        guard let url = URL(string: urlString), urlString.count > 0 else {
            throw NetworkError.invalidURL
        }
        let session = URLSession(configuration: .default)
        let (data, response) = try await session.data(from: url)
        if (response as? HTTPURLResponse)?.statusCode == 200 {
            let decoder = JSONDecoder()
            let object = try decoder.decode(T.self, from: data)
            return object
        }
        throw NetworkError.invalidResponse
    }

}
