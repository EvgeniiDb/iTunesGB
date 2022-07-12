//
//  SearchInteractor.swift
//  iOSArchitecturesDemo
//
//  Created by Евгений Доброволец on 12.07.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import Foundation
import Alamofire

protocol SearchInteractorInput {
    func requestApps(with query: String, completion: @escaping (Result<[ITunesApp]>) -> Void)
}

class SearchInteractor: SearchInteractorInput {
    private let searchService = ITunesSearchService()
    
    func requestApps(with query: String, completion: @escaping (Result<[ITunesApp]>) -> Void) {
        
        
        searchService.getApps(forQuery: query, then: completion)
    }
}
