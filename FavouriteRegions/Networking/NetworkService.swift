//
//  NetworkService.swift
//  FavouriteRegions
//
//  Created by Настя Лазарева on 24.08.2023.
//

import Foundation

protocol NetworkProtocol {
    func fetch(handler: @escaping (Result<[Region], Error>) -> Void)
}

class NetworkService: NetworkProtocol {
    
    private let decoder = JSONDecoder()
    static let urlString = "https://vmeste.wildberries.ru/api/guide-service/v1/getBrands"

    func fetch(handler: @escaping (Result<[Region], Error>) -> Void) {
        guard let url = URL(string: NetworkService.urlString) else { return }
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error{
                handler(.failure(error))
                return
            }
            
            if let response = response as? HTTPURLResponse,
               !response.isSuccessful {
                handler(.failure(NetworkErrors.requestFailed(response)))
                return
            }
            
            guard let data = data else { return }
            do {
                let json = try JSONDecoder().decode(RegionList.self, from: data)
                var regions = [Region]()
                json.brands.forEach { regions.append($0.convert()) }
                handler(.success(regions))
            } catch let err {
                handler(.failure(NetworkErrors.decodingError(err)))
            }
        }
        
        task.resume()
    }
}

enum NetworkErrors: Error {
    case wrongURL(URLComponents)
    case requestFailed(URLResponse)
    case decodingError(Error)
}

