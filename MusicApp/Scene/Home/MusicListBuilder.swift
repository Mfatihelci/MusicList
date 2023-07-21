//
//  MusicListBuilder.swift
//  network
//
//  Created by muhammed fatih elçi on 16.07.2023.
//

import Foundation

class MusicListBuilder {
    static func make() -> ViewController {
        let view = ViewController()
        view.viewModel = MusicListViewModel(service: MusicService())
        return view
    }
}
