//
//  MusicDetailBuilder.swift
//  network
//
//  Created by muhammed fatih elçi on 17.07.2023.
//

import Foundation
import Alamofire

final class MusicDetailBuilder {
    static func make(music: Result ) -> MusicDetailViewController {
        let vc = MusicDetailViewController()
        let viewModel = MusicDetailViewModel(view: vc, musıc: music)
        vc.viewModel = viewModel
        return vc
    }
}
