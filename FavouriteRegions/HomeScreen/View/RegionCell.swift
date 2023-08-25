//
//  RegionCell.swift
//  FavouriteRegions
//
//  Created by Настя Лазарева on 24.08.2023.
//

import Foundation
import UIKit

class RegionCell: UITableViewCell {
    
    
    private let regionCellView = RegionCellView()
    
    private var likeButton : LikeButton?
    
    func configure(with model : Region, delegate : UpdateDelegate){
        likeButton = LikeButton(region: model)
        guard let likeButton = likeButton else {return}
        backgroundColor = .clear
        contentView.addSubview(regionCellView)
        contentView.addSubview(likeButton)
        regionCellView.configure(with: model)
        likeButton.delegate = delegate
        setupConstraints()
    }
    
    private func setupConstraints(){
        guard let likeButton = likeButton else {return}
        NSLayoutConstraint.activate([
            regionCellView.topAnchor.constraint(equalTo: topAnchor),
            regionCellView.bottomAnchor.constraint(equalTo: bottomAnchor),
            regionCellView.leadingAnchor.constraint(equalTo: leadingAnchor),
            regionCellView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            likeButton.topAnchor.constraint(equalTo: topAnchor, constant: Static.Layout.sidePadding),
            likeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Static.Layout.sidePadding),
            likeButton.widthAnchor.constraint(equalToConstant: Static.Layout.likeButtonWidth),
            likeButton.heightAnchor.constraint(equalToConstant: Static.Layout.likeButtonHeiht)
        ])
    }
}
