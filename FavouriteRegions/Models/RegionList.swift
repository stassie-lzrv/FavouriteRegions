//
//  RegionList.swift
//  FavouriteRegions
//
//  Created by Настя Лазарева on 24.08.2023.
//

import Foundation

// MARK: - RegionList
struct RegionList: Codable {
    let brands: [Brand]
}

// MARK: - Brand
struct Brand: Codable {
    let brandID, title: String
    let thumbUrls: [String]
    let tagIDS: [String]
    let slug, type: String
    let viewsCount: Int

    enum CodingKeys: String, CodingKey {
        case brandID = "brandId"
        case title, thumbUrls
        case tagIDS = "tagIds"
        case slug, type, viewsCount
    }
    
    func convert() -> Region {
        Region(
            brandId: self.brandID,
            title: self.title,
            thumbUrls: self.thumbUrls,
            viewsCount: self.viewsCount
        )
    }
}
