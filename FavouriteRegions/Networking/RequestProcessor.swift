//
//  RequestProcessor.swift
//  FavouriteRegions
//
//  Created by Настя Лазарева on 24.08.2023.
//

import Foundation

// MARK: Unused

protocol RequestProcessoeProtocol {
    
    static func makeURL() throws -> URL
    static func performRequest(with url: URL) async throws -> (Data, HTTPURLResponse)
    static func createURLRequest(url: URL) throws -> URLRequest
    static func performDataTask(for request: URLRequest) async throws -> (Data, HTTPURLResponse)
}


