//
//  SearchBuilder.swift
//  iOSArchitecturesDemo
//
//  Created by Евгений Доброволец on 04.07.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation
import UIKit

class SearchBuilder {
    
    static func build() -> (UIViewController & SearchViewInput) {
        let presenter = SearchPresenter()
        let viewController = SearchViewController(searchPresenter: presenter)
        
        presenter.viewInput = viewController
        return viewController
    }
    
}
