//
//  MusicDetailViewModel.swift
//  network
//
//  Created by muhammed fatih elçi on 17.07.2023.
//

import Foundation
import Alamofire

class MusicDetailViewModel: MusıcDetailViewModelProtocol {
    
    var view: MusıcDetailViewModelDelegate?
    var musıc: Result
    
    init(view: MusıcDetailViewModelDelegate, musıc: Result) {
        self.view = view
        self.musıc = musıc
    }
    func load() {
        view?.update(musıc)
    }
}
