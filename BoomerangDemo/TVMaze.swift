//
//  DataManager.swift
//  BoomerangDemo
//
//  Created by Stefano Mondino on 11/11/16.
//  Copyright © 2016 Stefano Mondino. All rights reserved.
//

import Foundation
import Moya


enum TVMaze {
    case search(String)
    case image(URL)
}

extension TVMaze : TargetType {
    public var task: Task {
        return .request
    }

    public var sampleData: Data {
        switch self {
        case .search:
            return "{}".data(using: String.Encoding.utf8)!
        
        case .image:
            return "".data(using: String.Encoding.utf8)!
            
    }
    }

    public var baseURL: URL {
        switch self {
        case .image(let url) :
            return URL(string:"http://tvmazecdn.com")!
            
        default:
            return URL(string: "http://api.tvmaze.com")!
        }
        
         }
    public var path: String {
        switch self {
        case .search:
            return "search/shows"
        case .image(let url) :
            return url.path
        }
    }
    public var method: Moya.Method {
        return .get
    }
    public var parameters: [String: Any]? {
        switch self {
        case .search(let query):
            return ["q":query]
        
        case .image (_) :
        return nil
        }
    }
}


