//
//  ViewModel.swift
//  network
//
//  Created by muhammed fatih elçi on 16.07.2023.
//

import Foundation
import Alamofire

final class MusicListViewModel: MusicListViewModelProtocol{
    
    
    var delegate: MusicListViewModelDelegate?
    private var service: IMusicServiceProtocol?
    
    private var musics: [Result] = []
    init(service: IMusicServiceProtocol) {
        self.service = service
    }
    func load() {
        service?.fetchAllDatas(onSuccess: { [weak self](result) in
            self?.delegate?.handleOutPut(.showList(result))
            self?.musics = result
        }, onFail: { error in
            print(error.debugDescription)
        })
    }
    
    func searchMusic(key: String) {
        var musicList: [Result] = []
        musics.forEach({ item in
            if item.name.contains(key) {
                musicList.append(item)
            }
            
        })
        delegate?.handleOutPut(.showList(musicList))
    }
    
}
