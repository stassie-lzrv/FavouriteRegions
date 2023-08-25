//
//  UIViewController+.swift
//  FavouriteRegions
//
//  Created by Настя Лазарева on 25.08.2023.
//

import Foundation
import UIKit

extension UIViewController {
    func showAlert(title: String?, message: String?, _ action: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let repeatAction = UIAlertAction(title: Static.String.repeatStr, style: .default, handler: action)
        let cancelAction = UIAlertAction(title: Static.String.cancellStr, style: .cancel)
        
        alert.addAction(repeatAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true)
    }
}
