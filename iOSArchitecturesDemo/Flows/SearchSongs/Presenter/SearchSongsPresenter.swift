//
//  SearchSongsPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Евгений Доброволец on 03.07.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

/// Протокол для вызова контроллера SearchSongs из презентера
protocol SearchSongsViewOutput: AnyObject {
    
    /// Запускает поиск по переданному запросу
    func viewDidSearch(with query: String)
    
    /// Выполняет переход на подробный просмотр песни
    func viewDidSelectApp(song query: ITunesSong)
    
    /// Скачивает картинку в ячейку поиска песни
    func downloadImage(for cell: SongCell, using model: SongCellModel)
}

/// Протокол для вызова презентера из контроллера SearchSongs
protocol SearchSongsViewInput: AnyObject {
    
    /// Массив песен
    var searchResults: [ITunesSong] { get set }

    func showError(error: Error)
    func showNoResults()
    func hideNoResults()
    func throbber(show: Bool)
}

/// Презентер поиска песен
final class SearchSongsPresenter {
    
    /// Контроллер поиска песен
    weak var controller: (UIViewController & SearchSongsViewInput)?
    
    /// Сервис для запросов
    private let searchService = ITunesSearchService()
    
    /// Загрузчик картинок
    let imageDownloader = ImageDownloader()
    
    // MARK: - Private methods
    
    /// Запрашивает песни
    private func requestSongs(with query: String) {
        searchService.getSongs(forQuery: query) { [weak self] (result) in
            guard let self = self else { return }
            
            self.controller?.throbber(show: false)
            switch result {
            case .success(let songs):
                guard !songs.isEmpty else {
                    self.controller?.searchResults = []
                    self.controller?.showNoResults()
                    return
                }
                self.controller?.hideNoResults()
                self.controller?.searchResults = songs
            case .failure(let error):
                self.controller?.showError(error: error)
            }
        }
    }
    
    /// Открывает контроллер подробного просмотра песни
    private func openSong(with song: ITunesSong) {
        let songDetaillViewController = UIViewController()
        controller?.navigationController?.pushViewController(songDetaillViewController, animated: true)
    }
    
}

// MARK: - SearchSongsViewInput

extension SearchSongsPresenter: SearchSongsViewOutput {
    func viewDidSelectApp(song: ITunesSong) {
        openSong(with: song)
    }
    
    func viewDidSearch(with query: String) {
        controller?.throbber(show: true)
        requestSongs(with: query)
    }
    
    func downloadImage(for cell: SongCell, using model: SongCellModel) {
        guard let url = model.artwork else { return }
        imageDownloader.getImage(fromUrl: url) { image, error in
            
            DispatchQueue.main.async {
                cell.artworkImage.image = image
            }
        }
    }
}


