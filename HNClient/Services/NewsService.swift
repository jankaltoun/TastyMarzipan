//
//  NewsService.swift
//  HNClient
//
//  Created by strv on 13/06/2018.
//  Copyright © 2018 jankaltoun. All rights reserved.
//

import Alamofire
import PromiseKit

protocol NewsServiceProtocol {
    
    func getTopItems() -> Promise<[NewsItem]>
}

class NewsService: NewsServiceProtocol {
    
    func getTopItems() -> Promise<[NewsItem]> {
        
        return firstly {
            
            Alamofire
                .request(NewsRouter.getTopStories)
                .responseDecodable([Int].self)
        }.then { itemIDs -> Promise<[NewsItem]> in
            
            let promises = itemIDs.prefix(10).map { self.getItem(id: $0) }
            
            return when(fulfilled: promises)
        }.then { items in
            
            Promise.value(items)
        }
    }
    
    func getItem(id: Int) -> Promise<NewsItem> {
        
        return Alamofire
            .request(NewsRouter.getItem(id: id))
            .responseDecodable(NewsItem.self)
    }
}
