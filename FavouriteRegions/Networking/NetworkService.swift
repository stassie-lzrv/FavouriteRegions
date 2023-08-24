//
//  NetworkService.swift
//  FavouriteRegions
//
//  Created by Настя Лазарева on 24.08.2023.
//

import Foundation

protocol NetworkProtocol {
    func getRegionsList(handler: @escaping (Result<Data, Error>) -> Void) async
}

class NetworkService: NetworkProtocol {
    
    private let decoder = JSONDecoder()
    
    func getRegionsList(handler: @escaping (Result<Data, Error>) -> Void) async {
        do{
            let url = try RequestProcessor.makeURL()
            let (data, _) = try await RequestProcessor.performRequest(with: url)
            handler(.success(data))
        }catch{
            handler(.failure(error))
        }
    }
}
