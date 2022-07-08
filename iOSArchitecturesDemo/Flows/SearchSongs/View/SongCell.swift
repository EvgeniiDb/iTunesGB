//
//  SongCell.swift
//  iOSArchitecturesDemo
//
//  Created by Евгений Доброволец on 08.07.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

final class SongCell: UITableViewCell {
    
    // MARK: - Subviews
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16.0)
        return label
    }()
    
    private(set) lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 13.0)
        return label
    }()
    
    private(set) lazy var artworkImage: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5.0
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configureUI()
    }
    
    // MARK: - Methods
    
    func configure(with cellModel: SongCellModel) {
        self.titleLabel.text = cellModel.trackName
        self.subtitleLabel.text = cellModel.artistName
    }
    
    // MARK: - UI
    
    override func prepareForReuse() {
        [self.titleLabel, self.subtitleLabel].forEach { $0.text = nil }
    }
    
    private func configureUI() {
        self.addArtwork()
        self.addTitleLabel()
        self.addSubtitleLabel()
    }
    
    private func addArtwork() {
        self.contentView.addSubview(artworkImage)
        NSLayoutConstraint.activate([
            artworkImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0),
            artworkImage.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 12.0),
            artworkImage.heightAnchor.constraint(equalToConstant: 60),
            artworkImage.widthAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    private func addTitleLabel() {
        self.contentView.addSubview(self.titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8.0),
            titleLabel.leftAnchor.constraint(equalTo: artworkImage.rightAnchor, constant: 12.0),
            titleLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -8.0)
            ])
    }
    
    private func addSubtitleLabel() {
        self.contentView.addSubview(self.subtitleLabel)
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 4.0),
            subtitleLabel.leftAnchor.constraint(equalTo: artworkImage.rightAnchor, constant: 12.0),
            subtitleLabel.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -8.0)
            ])
    }
}

