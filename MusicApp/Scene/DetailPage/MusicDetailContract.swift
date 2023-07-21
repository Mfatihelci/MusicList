//
//  MusicDetailContract.swift
//  network
//
//  Created by muhammed fatih elçi on 17.07.2023.
//

import Foundation

//MARK: - DetailViewModel
protocol MusıcDetailViewModelProtocol {
    func load()
}

protocol MusıcDetailViewModelDelegate {
    func update(_ value: Result )
}
