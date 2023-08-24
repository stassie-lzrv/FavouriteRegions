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
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(textStyle: .subheadline)
        let eyeImage = UIImage(systemName: "eye", withConfiguration: config)
        imageView.image = eyeImage
        imageView.tintColor = .gray
        return imageView
    }()
    
    private let viewsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func configure(with model : Region){
        title.text = model.title
        viewsLabel.text = "\(model.viewsCount)"
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(title)
        addSubview(image)
        addSubview(viewsLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor,constant: 0),
            title.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 0),
            title.trailingAnchor.constraint(equalTo: trailingAnchor,constant: 0),
            
            image.topAnchor.constraint(equalTo: title.bottomAnchor,constant: 10),
            image.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 0),
            
            viewsLabel.centerYAnchor.constraint(equalTo: image.centerYAnchor),
            viewsLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor,constant: 0)
        ])
    }
}
