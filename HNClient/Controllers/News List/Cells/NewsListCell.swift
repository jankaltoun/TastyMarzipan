//
//  NewsListCell.swift
//  HNClient
//
//  Created by strv on 13/06/2018.
//  Copyright © 2018 jankaltoun. All rights reserved.
//

import UIKit

class NewsListCell: UITableViewCell {
    
    static let identifier = "news_list_cell"
    
    var stackView: UIStackView!
    var titleLabel: UILabel!
    var authorNameLabel: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Contents
extension NewsListCell {
    
    func setup(newsItem: NewsItem) {
        
        titleLabel.text = newsItem.title
        authorNameLabel.text = "Author: \(newsItem.authorName)"
    }
}

// MARK: - UI
extension NewsListCell {
    
    func setupUI() {
        
        // Title
        titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
        
        // Author's name
        authorNameLabel = UILabel()
        authorNameLabel.numberOfLines = 0
        authorNameLabel.font = UIFont.systemFont(ofSize: 15)
        
        // Stack View
        stackView = UIStackView()
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // This does not work on macOS
        /*NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1.0),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1.0),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1.0),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1.0)
        ])*/
        
        // This does work
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            bottomAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 16)
        ])
        
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(authorNameLabel)
    }
}
