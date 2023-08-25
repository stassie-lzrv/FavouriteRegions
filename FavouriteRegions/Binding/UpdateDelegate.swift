//
//  UpdateDelegate.swift
//  FavouriteRegions
//
//  Created by Настя Лазарева on 25.08.2023.
//

import Foundation

protocol UpdateDelegate: AnyObject{
    func didUpdateFavourite(_ region: Region)
}
