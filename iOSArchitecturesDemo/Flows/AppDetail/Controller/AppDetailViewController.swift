//
//  AppDetailViewController.swift
//  iOSArchitecturesDemo
//
//  Created by Евгений Доброволец on 08.07.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//

import UIKit

final class AppDetailViewController: UIViewController {
    
    public var app: ITunesApp
    
    private lazy var headerViewController = AppDetailHeaderViewController(app: app)
    private lazy var whatsNewViewController = AppWhatsNewViewController(app: app)
    private lazy var screenshotsViewController = AppScreenshotsViewController(app: app)
    
    private let imageDownloader = ImageDownloader()
    
    private var appDetailView: AppDetailView {
        return self.view as! AppDetailView
    }
    
    init(app: ITunesApp) {
        self.app = app
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        super.loadView()
        self.view = AppDetailView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    // MARK: - Private
    
    private func configureUI() {
        view.backgroundColor = .white
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        self.navigationItem.largeTitleDisplayMode = .never
        
        addHeaderViewController()
        addWhatsNewViewController()
        addScreenshotsViewController()
    }
    
    /// Добавляет контроллер заголовка
    private func addHeaderViewController() {
        self.addChild(headerViewController)
        appDetailView.scrollView.addSubview(headerViewController.view)
        
        headerViewController.didMove(toParent: self)
        headerViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerViewController.view.topAnchor.constraint(equalTo: appDetailView.scrollView.topAnchor),
            headerViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            headerViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
        
    }
    
    /// Добавляет контроллер описания изменений в последней версии
    private func addWhatsNewViewController() {
        self.addChild(whatsNewViewController)
        appDetailView.scrollView.addSubview(whatsNewViewController.view)
        
        whatsNewViewController.didMove(toParent: self)
        whatsNewViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            whatsNewViewController.view.topAnchor.constraint(
                equalTo: headerViewController.view.bottomAnchor, constant: 16
            ),
            whatsNewViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            whatsNewViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        ])
    }
    
    /// Добавляет контроллер отображения скриншотов
    private func addScreenshotsViewController() {
        self.addChild(screenshotsViewController)
        appDetailView.scrollView.addSubview(screenshotsViewController.view)
        
        screenshotsViewController.didMove(toParent: self)
        screenshotsViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            screenshotsViewController.view.topAnchor.constraint(
                equalTo: whatsNewViewController.view.bottomAnchor, constant: 16
            ),
            screenshotsViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            screenshotsViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            screenshotsViewController.view.bottomAnchor.constraint(equalTo: appDetailView.scrollView.bottomAnchor)
        ])
    }
}

