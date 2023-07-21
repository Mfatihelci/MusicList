//
//  TableViewCell.swift
//  network
//
//  Created by muhammed fatih elçi on 16.07.2023.
//

import UIKit
import SnapKit
import AlamofireImage

class TableViewCell: UITableViewCell {
    
    private var image = UIImageView()
    private var artistName: UILabel = UILabel()
    private var name: UILabel = UILabel()
    
    enum Identifier: String {
        case ID = "Cell"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        drawDesing()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(image)
        addSubview(artistName)
        addSubview(name)
        makeImage()
        makeArtistName()
        makeName()
    }
    
    private func drawDesing() {
        name.textColor = .black
        artistName.textColor = .black
        name.font = .boldSystemFont(ofSize: 20)
        artistName.font = .boldSystemFont(ofSize: 20)
    }
    
    func saveModel(value: Result) {
        name.text = value.name
        artistName.text = value.artistName
        image.af.setImage(withURL: URL(string: value.artworkUrl100)!)
    }
}

extension TableViewCell {
    private func makeImage() {
        image.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(5)
            make.left.equalTo(contentView).offset(20)
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
    }
    
    private func makeArtistName() {
        artistName.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(15)
            make.left.equalTo(image.snp.right).offset(10)
            make.right.equalTo(contentView).offset(-10)
        }
    }
    
    private func makeName() {
        name.snp.makeConstraints { make in
            make.top.equalTo(artistName.snp.bottom).offset(10)
            make.left.equalTo(image.snp.right).offset(10)
            make.right.equalTo(contentView).offset(-10)
        }
    }
}
