//
//  MusicListContract.swift
//  network
//
//  Created by muhammed fatih elçi on 16.07.2023.
//

import Foundation


//MARK: - ViewModel
protocol MusicListViewModelProtocol {
    var delegate: MusicListViewModelDelegate? { get set }
    func load()
    func searchMusic(key: String)    
}

enum MusicListViewModelOutPut {
    case showList([Result])
}

protocol MusicListViewModelDelegate {
    func handleOutPut(_ output: MusicListViewModelOutPut)
}

//MARK: - Provider
protocol MusicListProviderProtocol {
    func update(value: [Result])
}

protocol MusicListProviderDelegate {
    func onSelected(value: Result)
}
