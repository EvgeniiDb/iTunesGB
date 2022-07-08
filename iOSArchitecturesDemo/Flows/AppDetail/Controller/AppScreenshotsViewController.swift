//
//  AppScreenshotsViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Евгений Доброволец on 08.07.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

/// Контроллер для отображения данных об изменениях в новой версии
final class AppScreenshotsViewController: UIViewController {
    
    /// Модель приложения
    private let app: ITunesApp
    
    /// Сервис по загрузке картинок
    private lazy var imageDownloader = ImageDownloader()
    
    /// Кастомная вью
    private var appScreenshotsView: AppScreenshotsView {
        return self.view as! AppScreenshotsView
    }
    
    // MARK: - Init
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - LifeCycle
    
    override func loadView() {
        self.view = AppScreenshotsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
        configureCollection()
    }
    
    // MARK: - Private methods
    
    /// Заполняет вью контроллера данными
    private func fillData() {
        appScreenshotsView.titleLabel.text = "Скриншоты"
    }
    
    /// Настраивает коллекцию
    private func configureCollection() {
        appScreenshotsView.collectionView.dataSource = self
        appScreenshotsView.collectionView.delegate = self
        
        appScreenshotsView.collectionView.register(
            AppScreenshotsCollectionCell.self,
            forCellWithReuseIdentifier: "AppScreenshotsCell"
        )
    }
    
    /// Загружает картинку
    private func loadImage(for cell: AppScreenshotsCollectionCell, at indexPath: IndexPath) {
        imageDownloader.getImage(fromUrl: app.screenshotUrls[indexPath.row]) { image, error in
            
            DispatchQueue.main.async {
                cell.configure(with: image ?? UIImage())
            }
        }
    }
}

// MARK: - UICollectionViewDataSource

extension AppScreenshotsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        app.screenshotUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = appScreenshotsView.collectionView.dequeueReusableCell(
            withReuseIdentifier: "AppScreenshotsCell",
            for: indexPath
        ) as? AppScreenshotsCollectionCell else {
            return AppScreenshotsCollectionCell()
        }
        
        loadImage(for: cell, at: indexPath)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension AppScreenshotsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frameCV = appScreenshotsView.collectionView.frame
        return CGSize(width: frameCV.height * 0.56, height: frameCV.height)
    }
}

