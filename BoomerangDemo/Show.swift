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
import Result
import ReactiveSwift
import Boomerang


struct QueryResult : Decodable, ModelType {
    var score:Int?
    var show:Show!
    var title: String? { return ""}
    init?(json: JSON) {
        self.score = "score" <~~ json
        self.show = "show" <~~ json
    }
}

struct Show : Decodable, ModelType {
    var id:Int?
    var title:String?
    var imageURL : URL?
    var placeholder = Image()
    init?(json: JSON) {
        guard let name: String = "name" <~~ json
            else { return nil }
        self.title  =  name
        self.id = "id" <~~ json
        self.imageURL =  "image.original" <~~ json
    }
    static var provider = ReactiveCocoaMoyaProvider<TVMaze>()
    static func query(_ query:String) -> SignalProducer<[Show],NSError> {
        
        return provider.request(token: .search(query))
            .mapArray(type: QueryResult.self)
            .map { queryResults in queryResults.map {$0.show}}
            .flatMapError({ (error) -> SignalProducer<[Show], NSError> in
            return SignalProducer(error:NSError(domain: "", code: 0, userInfo: nil))
        })
    }
    var detail:SignalProducer<Show,NSError> {
        return Show.provider.request(token: .detail(identifier: String(stringInterpolationSegment:self.id))).mapObject(type: Show.self)
            .flatMapError({ (error) -> SignalProducer<Show, NSError> in
                return SignalProducer(error:NSError(domain: "", code: 0, userInfo: nil))
            })
    }
    var image:SignalProducer<Image,NoError> {
        if (self.imageURL != nil) {
        return Show.provider.request(token: .image(self.imageURL!)).mapImage().flatMapError({error -> SignalProducer<Image, NoError> in
            return SignalProducer(value:self.placeholder)
        }).prefix(value: self.placeholder)
        }
        return SignalProducer(value:self.placeholder)
    }
    
    
    static var placeholder = Show.init(json: ["name":""])
    
}
