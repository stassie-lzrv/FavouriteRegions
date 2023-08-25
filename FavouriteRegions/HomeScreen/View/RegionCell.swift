//
//  RegionCell.swift
//  FavouriteRegions
//
//  Created by Настя Лазарева on 24.08.2023.
//

import Foundation
import UIKit

class RegionCell: UITableViewCell {
    
    static let identifier = "regionCell"
    
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
            regionCellView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            regionCellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            regionCellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            regionCellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            likeButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            likeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            likeButton.widthAnchor.constraint(equalToConstant: 40),
            likeButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
