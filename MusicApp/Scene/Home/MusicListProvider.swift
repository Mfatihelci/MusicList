//
//  MusicListProvider.swift
//  network
//
//  Created by muhammed fatih elçi on 16.07.2023.
//

import UIKit
import Alamofire

class MusicListProvider: NSObject{
    var delegate: MusicListProviderDelegate?
    var musicL: [Result] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicL.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let music = musicL[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.Identifier.ID.rawValue) as? TableViewCell else {
            return UITableViewCell()
        }
        cell.saveModel(value: music)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.onSelected(value: musicL[indexPath.row])
        
    }
}

extension MusicListProvider: UITableViewDataSource,UITableViewDelegate {}

extension MusicListProvider: MusicListProviderProtocol {
    
    func update(value: [Result]) {
        let data = value
        musicL = data
    }
}


