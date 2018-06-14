//
//  NewsItem.swift
//  HNClient
//
//  Created by strv on 13/06/2018.
//  Copyright © 2018 jankaltoun. All rights reserved.
//

struct NewsItem: Codable {
    
    var id: Int
    var title: String
    var authorName: String
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case title
        case authorName = "by"
    }
}
