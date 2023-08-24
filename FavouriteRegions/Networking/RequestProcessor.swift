//
//  RequestProcessor.swift
//  FavouriteRegions
//
//  Created by Настя Лазарева on 24.08.2023.
//

import Foundation


class RequestProcessor {
    static let urlString = "https://vmeste.wildberries.ru/api/guide-service/v1/getBrands"
    
    static func makeURL() throws -> URL {
        guard let url = URL(string: RequestProcessor.urlString) else {
            throw RequestProcessorErrors.wrongURL(URLComponents(string: RequestProcessor.urlString) ?? URLComponents())
        }
        return url
    }
    
    static func performRequest(with url: URL) async throws -> (Data, HTTPURLResponse) {
        let request = try createURLRequest(url: url)
        return try await performDataTask(for: request)
    }
    
    private static func createURLRequest(url: URL) throws -> URLRequest {
        let request = URLRequest(url: url)
        return request
    }
    
    private static func performDataTask(for request: URLRequest) async throws -> (Data, HTTPURLResponse) {
        let session = URLSession(configuration: .default)
        let (data, response) = try await session.data(for: request)
        guard let httpURLResponse = response.httpURLResponse,
              httpURLResponse.isSuccessful else {
            throw RequestProcessorErrors.requestFailed(response)
        }
        return (data, httpURLResponse)
    }
}

enum RequestProcessorErrors: Error {
    case wrongURL(URLComponents)
    case requestFailed(URLResponse)
}

extension URLResponse {
    var httpURLResponse: HTTPURLResponse? {
        self as? HTTPURLResponse
    }
}

extension HTTPURLResponse {
    var isSuccessful: Bool {
        200 ... 299 ~= statusCode
    }
}

