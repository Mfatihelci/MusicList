//
//  MusicDetailViewController.swift
//  network
//
//  Created by muhammed fatih elçi on 17.07.2023.
//

import UIKit
import SnapKit
import AlamofireImage

class MusicDetailViewController: UIViewController {
    
    private let image: UIImageView = UIImageView()
    private let artist: UILabel = UILabel()
    private let artistName: UILabel = UILabel()
    private let genre: UILabel = UILabel()
    private let button: UIButton = UIButton()
    private var url: String = ""
    
    var viewModel: MusicDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel?.load()
        configure()
        drawDesing()
        clickButton()
    }
    private func configure() {
        view.addSubview(image)
        view.addSubview(artist)
        view.addSubview(artistName)
        view.addSubview(genre)
        view.addSubview(button)
        makeImage()
        makeArtistName()
        makeArtist()
        makeGenre()
        makeButton()
    }
    
    private func drawDesing() {
        view.backgroundColor = .white
        artist.font = .boldSystemFont(ofSize: 20)
        artistName.font = .boldSystemFont(ofSize: 20)
        genre.font = .boldSystemFont(ofSize: 20)
        self.title = "Detail"
        button.setTitle("ITunes", for: .normal)
        button.setTitleColor(UIColor.black , for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        button.layer.cornerCurve = .continuous
        button.clipsToBounds = true
        button.backgroundColor = UIColor.green
        button.layer.cornerRadius = 10
    }
    
    func clickButton() {
        button.addTarget(self, action: #selector(clickUrl), for: .touchUpInside)
    }
    
    @objc func clickUrl() {
        if let url = URL(string: "\(url)") {
            UIApplication.shared.open(url,options: [:])
        }
    }
    
}

extension MusicDetailViewController: MusıcDetailViewModelDelegate {
    func update(_ value: Result) {
        artist.text = value.name
        artistName.text = value.artistName
        genre.text = value.genres.map({$0.name.rawValue}).joined()
        image.af.setImage(withURL: URL(string: value.artworkUrl100)!)
        url = value.artistURL
    }
}

extension MusicDetailViewController {
    private func makeImage() {
        image.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(25)
            make.centerX.equalTo(view.center.x)
            make.height.equalTo(160)
            make.width.equalTo(160)
        }
    }
    
    private func makeArtist() {
        artist.snp.makeConstraints { make in
            make.top.equalTo(image.snp.bottom).offset(20)
            make.centerX.equalTo(view.center.x)
        }
    }
    
    private func makeArtistName() {
        artistName.snp.makeConstraints { make in
            make.top.equalTo(artist.snp.bottom).offset(20)
            make.centerX.equalTo(view.center.x)
        }
    }
    
    private func makeGenre() {
        genre.snp.makeConstraints { make in
            make.top.equalTo(artistName.snp.bottom).offset(20)
            make.centerX.equalTo(view.center.x)
        }
    }
    
    private func makeButton() {
        button.snp.makeConstraints { make in
            make.top.equalTo(genre.snp.bottom).offset(20)
            make.centerX.equalTo(view.center.x)
            make.left.equalTo(view).offset(50)
            make.right.equalTo(view).offset(-50)
        }
    }
}
