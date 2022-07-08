//
//  AppScreenshotsCollectionCell.swift
//  iOSArchitecturesDemo
//
//  Created by Евгений Доброволец on 08.07.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

/// Ячейка для коллекции скриншотов приложения
final class AppScreenshotsCollectionCell: UICollectionViewCell {
    
    /// ID ячейки
    public var identifier: String = "AppScreenshotsCell"
    
    /// Основная вью с картинкой
    private let photoView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
    
    let throbber = UIActivityIndicatorView(style: .gray)
    
    /// Конфигурирует ячейку
    func configure(with image: UIImage) {
        contentView.addSubview(photoView)
        photoView.image = image
        setupConstraints()
    }
    
    private func addImageViewThrobber() {
        throbber.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(throbber)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            photoView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
}

