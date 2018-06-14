//
//  AppContainer.swift
//  HNClient
//
//  Created by strv on 13/06/2018.
//  Copyright © 2018 jankaltoun. All rights reserved.
//

import Swinject

class AppContainer {
    
    static let shared = AppContainer()
    
    let container = Container()
    
    init() {
        
        register()
    }
    
    func resolve<Item>(_ item: Item.Type) -> Item? {
        
        return container.resolve(item)
    }
    
    func register() {
        
        container.register(NewsServiceProtocol.self) { _ in
            
            return NewsService()
        }
        
        container.register(NewsListViewModel.self) { resolver in
            
            return NewsListViewModel(
                newsService: resolver.resolve(NewsServiceProtocol.self)!
            )
        }
    }
}
