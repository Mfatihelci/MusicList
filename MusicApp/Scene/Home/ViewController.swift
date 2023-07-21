//
//  ViewController.swift
//  network
//
//  Created by muhammed fatih elçi on 16.07.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var viewModel: MusicListViewModelProtocol?
    var provider = MusicListProvider()
    private var tableview = UITableView()
    var searchController = UISearchController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.delegate = self
        viewModel?.load()
        configure()
        initDelegate()
    }
    
    func initDelegate() {
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "arama yap"
        tableview.dataSource = provider
        tableview.delegate = provider
        provider.delegate = self
        tableview.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.Identifier.ID.rawValue)
        
    }
    
    func configure() {
        navigationItem.searchController = searchController
        view.addSubview(tableview)
        makeTableView()
        drawDesing()
    }
    
    func drawDesing() {
        view.backgroundColor = .yellow
        tableview.rowHeight = 150
        title = "Music"
    }
}

extension ViewController: MusicListViewModelDelegate {
    func handleOutPut(_ output: MusicListViewModelOutPut) {
        switch output {
        case .showList(let list):
            //provider.musicL.removeAll()
            provider.update(value: list)
        }
        DispatchQueue.main.async {
            self.tableview.reloadData()
        }
    }
}

extension ViewController {
    func makeTableView() {
        tableview.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(0)
            make.leading.trailing.equalTo(view)
            make.bottom.equalToSuperview()
        }
    }
}

extension ViewController: MusicListProviderDelegate {
    func onSelected(value: Result) {
        let vc = MusicDetailBuilder.make(music: value)
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchController.searchBar.text != "" {
            viewModel?.searchMusic(key: searchText)
        }else {
            viewModel?.load()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchController.searchBar.text?.removeAll()
        viewModel?.load()
    }
}
