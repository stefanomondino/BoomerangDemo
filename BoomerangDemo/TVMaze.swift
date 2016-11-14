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
    case detail(identifier:String)
    case image(URL)
}

extension TVMaze : TargetType {
    public var task: Task {
        return .request
    }
    
    public var sampleData: Data {
        switch self {
        
            
        case .image:
            return "".data(using: String.Encoding.utf8)!
        default:
            return "{}".data(using: String.Encoding.utf8)!
        }
    }
    
    public var baseURL: URL {
        switch self {
        case .image(let url) :
            
            return URL(string:(url.scheme! + "://" + url.host!))!
            
        default:
            return URL(string: "http://api.tvmaze.com")!
        }
        
    }
    public var path: String {
        switch self {
        case .search:
            return "search/shows"
        case .detail(let identifier):
            return "shows/\(identifier)"
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
            
        default :
            return nil
        }
    }
}


