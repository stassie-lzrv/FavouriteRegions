//
//  DetailViewModel.swift
//  FavouriteRegions
//
//  Created by Настя Лазарева on 25.08.2023.
//

import Foundation

class DetailViewModel {
    @Observable var region: Region 
    
    init(region: Region) {
        self.region = region
    }
}
