//
//  ViewController.swift
//  HNClient
//
//  Created by strv on 10/06/2018.
//  Copyright © 2018 jankaltoun. All rights reserved.
//

import UIKit

class NewsListViewController: UIViewController {
    
    var viewModel: NewsListViewModel?
    
    var label: UILabel!
    var tableView: UITableView!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        viewModel?.fetchNewsItems { _ in
            
            // We don't handle errors, ha ha!
            
            self.tableView.reloadData()
        }
    }
}

// MARK: - UI

extension NewsListViewController {
    
    func setupUI() {
        
        view.backgroundColor = .white
        
        tableView = UITableView()
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        tableView.register(NewsListCell.self, forCellReuseIdentifier: NewsListCell.identifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.dataSource = self
    }
}

// MARK: - UITableView data source

extension NewsListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel?.newsItems.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: NewsListCell.identifier) as? NewsListCell
        else {
            
            assertionFailure("Could not dequeue cell.")
            
            return UITableViewCell()
        }
        
        if let newsItem = viewModel?.getNewsItem(at: indexPath.item) {
            
            cell.setup(newsItem: newsItem)
        }
        
        return cell
    }
}
