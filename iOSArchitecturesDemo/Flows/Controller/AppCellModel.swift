//
//  AppCellModel.swift
//  iOSArchitecturesDemo
//
//  Created by Евгений Доброволец on 08.07.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation

struct AppCellModel {
    let title: String
    let subtitle: String?
    let rating: String?
}

final class AppCellModelFactory {
    
    static func cellModel(from model: ITunesApp) -> AppCellModel {
        return AppCellModel(title: model.appName,
                            subtitle: model.company,
                            rating: model.averageRating >>- { "\($0)" })
    }
}

