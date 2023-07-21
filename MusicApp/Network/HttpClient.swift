//
//  HttpClient.swift
//  network
//
//  Created by muhammed fatih elçi on 16.07.2023.
//
import Foundation
import Alamofire

protocol IMusicServiceProtocol {
    func fetchAllDatas(onSuccess: @escaping ([Result]) -> Void,onFail: @escaping (String) -> Void)
}


enum MusicServiceEndPoint: String {
    case BASE_URL = "https://rss.applemarketingtools.com/api/v2/tr/music/most-played/50/songs.json"
}

extension MusicServiceEndPoint {
    static func musicPath() -> String {
        return "\(BASE_URL.rawValue)"
    }
}

class MusicService: IMusicServiceProtocol {
    func fetchAllDatas(onSuccess: @escaping ([Result]) -> Void, onFail: @escaping (String) -> Void) {
        AF.request(MusicServiceEndPoint.musicPath(), method: .get).validate().responseDecodable(of: Welcome.self) { models in
            guard let data = models.value else {
                onFail(models.debugDescription)
                return
            }
            let dataTwo = data.feed.results
            onSuccess(dataTwo)
        }
    }
}
