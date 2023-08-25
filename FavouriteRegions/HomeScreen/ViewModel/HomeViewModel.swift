//
//  HomeViewModel.swift
//  FavouriteRegions
//
//  Created by Настя Лазарева on 23.08.2023.
//

import Foundation

class HomeViewModel {
    
    @Observable var regions: [Region] = []
    @Observable var isLoading: Bool = true
    private var networkService: NetworkProtocol = NetworkService()
    
    func numberOfSections() -> Int {
        return regions.count
    }
    
    func update(_ region: Region){
        if let ind =  regions.firstIndex(where: {$0.brandId == region.brandId}){
            regions[ind] = region
        }
    }
    
    func fetchRegions(_ completion: @escaping ([Region]) -> Void) {
        isLoading = true
        _ = Task {
            await networkService.getRegionsList( handler: { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let data):
                        do{
                            let json = try JSONDecoder().decode(RegionList.self, from: data)
                            var regions = [Region]()
                            json.brands.forEach { regions.append($0.convert()) }
                            self.regions = regions
                            self.isLoading = false
                            completion((regions))
                        } catch {
                            self.isLoading = true
                            completion((self.regions))
                        }
                    case .failure(_):
                        self.isLoading = true
                        completion((self.regions))
                    }
                }
            })
        }
    }
}

