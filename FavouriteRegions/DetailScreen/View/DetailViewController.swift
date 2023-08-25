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
    
    func bindViewModel() {
        likeButton.delegate = delegate
    }
}

// MARK: Setup views

private extension DetailViewController {
    
    func setupView() {
        view.backgroundColor = .backPrimaryColor
        setupBackButton()
        setupInfoView()
        setupLikeButton()
        setupCollectionView()
        setupConstraints()
    }
    
    func setupBackButton() {
        let backButton = UIBarButtonItem(
            image: UIImage(systemName: "arrowshape.turn.up.backward"),
            style: .done,
            target: self,
            action: #selector(goBack)
        )
        backButton.tintColor = .labelPrimaryColor
        navigationItem.leftBarButtonItem = backButton
    }
    
    func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.configure(with: viewModel.region.thumbUrls)
    }
    
    func setupInfoView() {
        view.addSubview(infoView)
    }
    
    func setupLikeButton() {
        view.addSubview(likeButton)
        likeButton.backgroundColor = .clear
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Static.Layout.sidePadding),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Static.Layout.sidePadding),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: Static.Layout.galleryHeight),
            
            likeButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: Static.Layout.galleryBottomPadding),
            likeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -Static.Layout.sidePadding),
            
            infoView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Static.Layout.sidePadding),
            infoView.trailingAnchor.constraint(equalTo: likeButton.leadingAnchor, constant: -Static.Layout.sidePadding),
            infoView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: Static.Layout.galleryBottomPadding),
            infoView.heightAnchor.constraint(equalToConstant: Static.Layout.infoHeight)
        ])
    }
    
    func configure() {
        infoView.configure(with: viewModel.region)
    }
}

private extension DetailViewController {
    
    @objc
    private func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
