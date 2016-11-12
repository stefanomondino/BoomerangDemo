//
//  Movie.swift
//  BoomerangDemo
//
//  Created by Stefano Mondino on 11/11/16.
//  Copyright © 2016 Stefano Mondino. All rights reserved.
//

import Foundation
import Gloss
import Moya
import ReactiveSwift
import Boomerang

struct Show : Decodable, ModelType {
    var id:Int?
    var title:String?
    var imageURL : URL?
    init?(json: JSON) {
        guard let name: String = "show.name" <~~ json
            else { return nil }
        self.title  =  name
        self.id = "show.id" <~~ json
        self.imageURL =  "show.image.original" <~~ json
    }
    static var provider = ReactiveCocoaMoyaProvider<TVMaze>()
    static func query(_ query:String) -> SignalProducer<[Show],NSError> {
        
        return provider.request(token: .search(query)).mapArray(type: Show.self).flatMapError({ (error) -> SignalProducer<[Show], NSError> in
            return SignalProducer(error:NSError(domain: "", code: 0, userInfo: nil))
        })
    }
}
