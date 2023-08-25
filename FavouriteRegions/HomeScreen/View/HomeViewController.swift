//
//  HomeViewController.swift
//  FavouriteRegions
//
//  Created by Настя Лазарева on 23.08.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let viewModel = HomeViewModel()
    private var tableView = UITableView()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.hidesWhenStopped = true
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    // MARK: UI overriding
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bindViewModel()
        fetchData()
    }
    
}

// MARK: Setup views

private extension HomeViewController {
    
    func setupView() {
        view.backgroundColor = .white
        title = "Любимые регионы"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        setupTableView()
        setupConstraints()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.addSubview(activityIndicator)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(RegionCell.self, forCellReuseIdentifier: RegionCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            
            activityIndicator.centerXAnchor.constraint(equalTo: tableView.centerXAnchor,constant: 0),
            activityIndicator.centerYAnchor.constraint(equalTo: tableView.centerYAnchor,constant: 0),
        ])
    }
    
}

// MARK: Private extensions

private extension HomeViewController{
    
    private func fetchData(){
        viewModel.fetchRegions { [weak self] regions in
            guard let self = self else { return }
            if regions.isEmpty {
                let alert = UIAlertController(
                    title: "Ошибка загрузки данных",
                    message: "Повторите попытку",
                    preferredStyle: .alert
                )
                let repeatAction = UIAlertAction(title: "Повторить", style: .default, handler: { _ in self.fetchData()})
                let cancelAction = UIAlertAction(title: "Отменить", style: .cancel)
                alert.addAction(repeatAction)
                alert.addAction(cancelAction)
                self.present(alert, animated: true)
            } else {
                self.tableView.reloadData()
            }
        }
    }
    
    private func bindViewModel(){
        viewModel.$isLoading.bind { [weak self] isLoading in
            DispatchQueue.main.async {
                if isLoading {
                    self?.activityIndicator.startAnimating()
                } else {
                    self?.activityIndicator.stopAnimating()
                }
            }
        }
    }
    
    private func openDetailViewController(_ region: Region){
        let detailVC = DetailViewController(viewModel: DetailViewModel(region: region))
        detailVC.delegate = self
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

// MARK: TableView extensions

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = view.backgroundColor
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RegionCell.identifier, for: indexPath) as? RegionCell else { return UITableViewCell() }
        cell.configure(with:  viewModel.regions[indexPath.section], delegate: self)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let region = viewModel.regions[indexPath.section]
        openDetailViewController(region)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}

protocol UpdateDelegate: AnyObject{
    func didUpdateFavourite(_ region: Region)
}
extension HomeViewController : UpdateDelegate{
    func didUpdateFavourite(_ region: Region) {
        viewModel.update( region)
        tableView.reloadData()
    }
}
