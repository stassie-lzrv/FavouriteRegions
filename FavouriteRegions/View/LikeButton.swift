//
//  LikeButton.swift
//  FavouriteRegions
//
//  Created by Настя Лазарева on 24.08.2023.
//

import Foundation
import UIKit

final class LikeButton: UIButton {
    
    init() {
        super.init(frame: .zero)
        let config = UIImage.SymbolConfiguration(textStyle: .title2)
        let likeImage = UIImage(systemName: "suit.heart.fill", withConfiguration: config)
        setImage(likeImage, for: .normal)
        contentMode = .scaleAspectFill
        tintColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(toggleState), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    func toggleState(sender: UIButton){
        sender.tintColor = (sender.tintColor == .white ? .red : .white)
    }
}
