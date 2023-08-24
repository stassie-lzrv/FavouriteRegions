//
//  DetailViewController.swift
//  FavouriteRegions
//
//  Created by Настя Лазарева on 24.08.2023.
//

import Foundation
import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    private let contentView = UIView()
    private let collectionView = GalleryCollectionView()
    
    private let viewModel : DetailViewModel
    
    // MARK: UI overriding
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configure()
        bindViewModel()
    }
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindViewModel(){
        // TODO: like binding
    }
}

// MARK: Setup views

private extension DetailViewController {
    
    
    
    func setupView() {
        view.backgroundColor = .white
        setupBackground()
        setupBackButton()
        setupCollectionView()
        setupConstraints()
        
    }
    
    func setupBackButton(){
        let backButton = UIBarButtonItem(
            image: UIImage(systemName: "arrowshape.turn.up.backward"),
            style: .done,
            target: self,
            action: #selector(goBack)
        )
        backButton.tintColor = .black
        navigationItem.leftBarButtonItem = backButton
        
    }
    func setupBackground(){
        view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .white
        contentView.layer.opacity = 0.5
    }
    
    func setupCollectionView(){
        view.addSubview(collectionView)
        collectionView.configure(with: viewModel.region.thumbUrls)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            contentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            collectionView.heightAnchor.constraint(equalToConstant: 300)
            
        ])
    }
    
    func configure(){
    }
}

private extension DetailViewController {
    
    @objc
    private func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
