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
    private let infoView = InfoView()
    private let likeButton : LikeButton
    
    weak var delegate: UpdateDelegate?
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
        self.likeButton = LikeButton(region: viewModel.region)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindViewModel(){
        likeButton.delegate = delegate
    }
}

// MARK: Setup views

private extension DetailViewController {
    
    func setupView() {
        view.backgroundColor = .white
        setupBackground()
        setupBackButton()
        setupInfoView()
        setupLikeButton()
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
    
    func setupInfoView(){
        view.addSubview(infoView)
    }
    
    func setupLikeButton(){
        view.addSubview(likeButton)
        likeButton.backgroundColor = .clear
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            contentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            collectionView.heightAnchor.constraint(equalToConstant: 300),
            
            likeButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 30),
            likeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            likeButton.widthAnchor.constraint(equalToConstant: 40),
            likeButton.heightAnchor.constraint(equalToConstant: 30),
            
            infoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            infoView.trailingAnchor.constraint(equalTo: likeButton.leadingAnchor, constant: -10),
            infoView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 30),
            infoView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configure(){
        infoView.configure(with: viewModel.region)
    }
}

private extension DetailViewController {
    
    @objc
    private func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
