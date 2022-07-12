//
//  SearchPresenter.swift
//  iOSArchitecturesDemo
//
//  Created by Евгений Доброволец on 08.07.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation
import UIKit

protocol SearchViewInput: class {
    var searchResults: [ITunesApp] { get set }
    func showError(error: Error)
    func showNoResults()
    func hideNoResults()
    func throbber(show: Bool)
}

protocol SearchViewOutput: class {
    func viewDidSearch(with query: String)
    func viewDidSelectApp(_ app: ITunesApp)
}

class SearchPresenter {
    
    weak var viewInput: (UIViewController & SearchViewInput)?
    
    // MARK: - Private Properties
    
    let interactor: SearchInteractorInput
    let router: SearchRouterInput
    
    // MARK: - Init
    
    init(interactor: SearchInteractorInput, router: SearchRouterInput) {
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: - Private Functions
    
    private func requestApps(with query: String) {
        interactor.requestApps(with: query) { [weak self] result in
            guard let self = self else {
                return
            }
            
            self.viewInput?.throbber(show: false)
            result.withValue { apps in
                
                guard !apps.isEmpty else {
                    self.viewInput?.showNoResults()
                    return
                }
                self.viewInput?.hideNoResults()
                self.viewInput?.searchResults = apps
            } .withError {
                self.viewInput?.showError(error: $0)
            }
        }
    }
    
    private func openAppDetails(with app: ITunesApp) {
        router.openDetails(for: app)
    }
}

// MARK: - SearchViewOutput

extension SearchPresenter: SearchViewOutput {
    func viewDidSearch(with query: String) {
        self.viewInput?.throbber(show: true)
        self.requestApps(with: query)
    }
    
    func viewDidSelectApp(_ app: ITunesApp) {
        self.openAppDetails(with: app)
    }
}
