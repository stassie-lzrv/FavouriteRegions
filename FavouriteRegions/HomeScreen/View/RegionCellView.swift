//
//  RegionCellView.swift
//  FavouriteRegions
//
//  Created by Настя Лазарева on 24.08.2023.
//

import Foundation
import UIKit
import Kingfisher

class RegionCellView : UIView {
    private let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let label : UILabel = {
        let label = UILabel()
        label.font = Static.Font.cellFont
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func configure(with model: Region){
        label.text = model.title
        guard let url = URL(string: model.thumbUrls[0]) else { return }
        imageView.kf.setImage(
            with: url
        )
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        addSubview(label)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Static.Layout.sidePadding),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Static.Layout.sidePadding)
        ])
    }
    
}
