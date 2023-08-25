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
    var isFavourite: Bool = false 
    
    
}

extension Region {
    static let mockData : [Region] = [Region(brandId: "1", title: "Москва", thumbUrls: ["https://static-basket-02.wb.ru/vol22/travel/preview-ffwHk_JJ1o_1024x435.jpg"], viewsCount: 5),
                           Region(brandId: "2", title: "Санкт-Петербург", thumbUrls: ["https://static-basket-02.wb.ru/vol22/travel/preview-ffwHk_JJ1o_1024x435.jpg"], viewsCount: 10),
                           Region(brandId: "3", title: "Сочи", thumbUrls: ["https://static-basket-02.wb.ru/vol22/travel/preview-ffwHk_JJ1o_1024x435.jpg"], viewsCount: 1000),
                           Region(brandId: "4", title: "Казань", thumbUrls: ["https://static-basket-02.wb.ru/vol22/travel/preview-ffwHk_JJ1o_1024x435.jpg"], viewsCount: 18),
                           Region(brandId: "5", title: "Уфа", thumbUrls: ["https://static-basket-02.wb.ru/vol22/travel/preview-ffwHk_JJ1o_1024x435.jpg"], viewsCount: 0),]
}
