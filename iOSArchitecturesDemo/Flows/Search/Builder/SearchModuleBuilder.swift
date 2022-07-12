//
//  SearchModuleBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Евгений Доброволец on 12.07.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

class SearchModuleBuilder {
    static func build() -> (UIViewController & SearchViewInput) {
        let searchInteractor = SearchInteractor()
        let searchRouter = SearchRouter()
        let presenter = SearchPresenter(interactor: searchInteractor,
                                        router: searchRouter)
        let viewController = SearchViewController(searchPresenter: presenter)
        
        searchRouter.viewController = viewController
        presenter.viewInput = viewController
        
        return viewController
    }
}

