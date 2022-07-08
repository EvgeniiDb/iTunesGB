//
//  AppWhatsNewView.swift
//  iOSArchitecturesDemo
//
//  Created by Евгений Доброволец on 08.07.2022.
//  Copyright © 2022 ekireev. All rights reserved.
//
import UIKit

final class AppWhatsNewView: UIView {
    
    // MARK: - Subviews
    
    private(set) lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        
        return label
    }()
    
    private(set) lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 0
        
        return label
    }()
    
    private(set) lazy var notesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 0
        
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    
    private func configureUI() {
        addSubviews()
        addConstraints()
    }
    
    private func addSubviews() {
        self.addSubview(titleLabel)
        self.addSubview(subTitleLabel)
        self.addSubview(notesLabel)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            subTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            notesLabel.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 16),
            notesLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            notesLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            notesLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}
