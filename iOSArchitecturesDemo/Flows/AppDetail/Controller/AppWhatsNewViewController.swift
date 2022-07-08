//
//  AppWhatsNewViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Евгений Доброволец on 08.07.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

/// Контроллер для отображения данных об изменениях в новой версии
final class AppWhatsNewViewController: UIViewController {
    
    /// Модель приложения
    private let app: ITunesApp
    
    /// Кастомная вью
    private var appWhatsNewView: AppWhatsNewView {
        return self.view as! AppWhatsNewView
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
        self.view = AppWhatsNewView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()
    }
    
    // MARK: - Private methods
    
    /// Заполняет вью контроллера данными
    private func fillData() {
        guard let version = app.version,
              let notes = app.releaseNotes else {
                  return
              }
        
        appWhatsNewView.titleLabel.text = "Что нового"
        appWhatsNewView.subTitleLabel.text = "Версия \(version)"
        appWhatsNewView.notesLabel.text = notes
    }
}

