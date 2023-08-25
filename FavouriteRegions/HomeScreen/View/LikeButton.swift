//
//  LikeButton.swift
//  FavouriteRegions
//
//  Created by Настя Лазарева on 24.08.2023.
//

import Foundation
import UIKit

class LikeButton: UIButton {
    weak var delegate : UpdateDelegate?
    private var region: Region
    
    init(region: Region) {
        self.region = region
        super.init(frame: .zero)
        let config = UIImage.SymbolConfiguration(textStyle: .title2)
        let likeImage = UIImage(systemName: Static.Image.heartImageName, withConfiguration: config)
        setImage(likeImage, for: .normal)
        contentMode = .scaleAspectFill
        tintColor = (region.isFavourite ? .redColor : .supportGrayColor)
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(toggleState), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func toggleState(sender: UIButton){
        UIView.animate(withDuration: 0.2){
            sender.tintColor = (sender.tintColor == .supportGrayColor ? .red : .supportGrayColor)
        }
        region.isFavourite.toggle()
        delegate?.didUpdateFavourite(region)
    }
}
