//
//  NewsRouter.swift
//  HNClient
//
//  Created by strv on 13/06/2018.
//  Copyright © 2018 jankaltoun. All rights reserved.
//

import Alamofire

enum NewsRouter: URLRequestConvertible {
    
    case getTopStories
    case getItem(id: Int)
    
    static let baseURLString = "https://hacker-news.firebaseio.com/v0"
    
    var method: HTTPMethod {
        
        return .get
    }
    
    var path: String {
        
        switch self {
        case .getTopStories:
            
            return "topstories.json"
        case .getItem(let id):
            
            return "item/\(id).json"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let url = try NewsRouter.baseURLString.asURL()
        let urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        return try URLEncoding.default.encode(urlRequest, with: nil)
    }
}
