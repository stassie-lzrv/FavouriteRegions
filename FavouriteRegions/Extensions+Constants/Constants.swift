//
//  Constants.swift
//  FavouriteRegions
//
//  Created by Настя Лазарева on 25.08.2023.
//

import Foundation
import UIKit

enum Static {
    enum String {
        static let repeatStr = "Повторить"
        static let cancellStr = "Отменить"
        static let errorAlertTittle = "Ошибка загрузки данных"
        static let errorAlertMesage = "Повторите попытку"
        static let mainTittle = "Любимые регионы"
        static let mainCellIdentifier = "regionCell"
        static let detailCellIdentifier = "galleryCollectionViewCell"
    }

    enum Layout {
        static let sidePadding: CGFloat = 10
        static let mainCellSize: CGFloat = 200
        static let detaulCellSize:CGSize = CGSize(width: 330, height: 250)
        static let likeButtonWidth: CGFloat = 40
        static let likeButtonHeiht: CGFloat = 30
        static let galleryHeight: CGFloat = 300
        static let galleryBottomPadding: CGFloat = 30
        static let infoHeight: CGFloat = 200
    }
    
    enum Font {
        static let cellFont: UIFont = .systemFont(ofSize: 15, weight: .bold)
        static let titleInfoFont: UIFont = .systemFont(ofSize: 26, weight: .bold)
        static let subtitleInfoFont: UIFont = .systemFont(ofSize: 14, weight: .bold)
    }
    
    enum Image {
        static let heartImageName = "suit.heart.fill"
        static let eyeImageName = "eye"
    }
}
