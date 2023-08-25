//
//  InfoView.swift
//  FavouriteRegions
//
//  Created by Настя Лазарева on 25.08.2023.
//

import Foundation
import UIKit

class InfoView: UIView {
    
    private let title: UILabel = {
        let label = UILabel()
        label.font = Static.Font.titleInfoFont
        label.textColor = .labelPrimaryColor
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(textStyle: .subheadline)
        let eyeImage = UIImage(systemName: Static.Image.eyeImageName, withConfiguration: config)
        imageView.image = eyeImage
        imageView.tintColor = .supportGrayColor
        return imageView
    }()
    
    private let viewsLabel: UILabel = {
        let label = UILabel()
        label.font = Static.Font.subtitleInfoFont
        label.textColor = .labelSecondaryColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func configure(with model : Region) {
        title.text = model.title
        viewsLabel.text = "\(model.viewsCount)"
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .backPrimaryColor
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(title)
        addSubview(image)
        addSubview(viewsLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            image.topAnchor.constraint(equalTo: title.bottomAnchor,constant: Static.Layout.sidePadding),
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            viewsLabel.centerYAnchor.constraint(equalTo: image.centerYAnchor),
            viewsLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor,constant: 2)
        ])
    }
}
