//
//  NewsListViewModel.swift
//  HNClient
//
//  Created by strv on 13/06/2018.
//  Copyright © 2018 jankaltoun. All rights reserved.
//

import PromiseKit

class NewsListViewModel {
    
    let newsService: NewsServiceProtocol
    
    var newsItems = [NewsItem]()
    
    init(newsService: NewsServiceProtocol) {
        
        self.newsService = newsService
    }
    
    func fetchNewsItems(completion: @escaping DataFetchCompletion) {
        
        firstly {
            
            newsService.getTopItems()
        }.done { items in
            
            print(items)
            
            self.newsItems = items
            
            completion(nil)
        }.catch { error in
            
            debugPrint(error)
            
            completion(error)
        }
    }
    
    func getNewsItem(at index: Int) -> NewsItem? {
        
        guard index < newsItems.count else {
            
            return nil
        }
        
        return newsItems[index]
    }
}
