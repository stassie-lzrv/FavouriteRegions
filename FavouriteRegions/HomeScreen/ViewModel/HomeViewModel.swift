//
//  HomeViewModel.swift
//  FavouriteRegions
//
//  Created by Настя Лазарева on 23.08.2023.
//

import Foundation

class HomeViewModel {
    
    @Observable var regions: [Region] = [] {
        didSet {
            self.isLoading = false
        }
    }
    
    @Observable var isLoading: Bool = true
    var onErrorMessage: ((Error)->Void)?
    private var networkService: NetworkProtocol = NetworkService()
    
    init() {
        self.fetchRegions()
    }
    
    func numberOfSections() -> Int {
        return regions.count
    }
    
    func update(_ region: Region){
        if let ind =  regions.firstIndex(where: {$0.brandId == region.brandId}){
            regions[ind] = region
        }
    }
    
    func fetchRegions() {
        isLoading = true
        networkService.fetch() { [weak self] result in
            switch result {
            case .success(let regions):
                self?.regions = regions
            case .failure(let error):
                self?.onErrorMessage?(error)
            }
        }
    }
}

