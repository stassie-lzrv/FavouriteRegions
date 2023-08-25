//
//  URLResponse+.swift
//  FavouriteRegions
//
//  Created by Настя Лазарева on 25.08.2023.
//

import Foundation

extension HTTPURLResponse {
    var isSuccessful: Bool {
        200 ... 299 ~= statusCode
    }
}
