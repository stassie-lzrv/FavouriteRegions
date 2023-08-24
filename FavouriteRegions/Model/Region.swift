//
//  Region.swift
//  FavouriteRegions
//
//  Created by Настя Лазарева on 23.08.2023.
//

import Foundation
struct Region {
    let brandId: String
    let title: String
    let thumbUrls: [String]
    let viewsCount: Int
}

extension Region {
    static let mockData : [Region] = [Region(brandId: "1", title: "Москва", thumbUrls: ["img"], viewsCount: 5),
                           Region(brandId: "2", title: "Санкт-Петербург", thumbUrls: ["img"], viewsCount: 10),
                           Region(brandId: "3", title: "Сочи", thumbUrls: ["img"], viewsCount: 1000),
                           Region(brandId: "4", title: "Казань", thumbUrls: ["img"], viewsCount: 18),
                           Region(brandId: "5", title: "Уфа", thumbUrls: ["img"], viewsCount: 0),]
}
