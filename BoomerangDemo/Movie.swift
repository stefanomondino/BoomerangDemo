//
//  Movie.swift
//  BoomerangDemo
//
//  Created by Stefano Mondino on 11/11/16.
//  Copyright © 2016 Stefano Mondino. All rights reserved.
//

import Foundation
import Gloss
struct Movie : Decodable {
    
    var title:String
    var imageURL : URL?
    init?(json: JSON) {
        guard let name: String = "show.name" <~~ json
            else { return nil }
        self.title  =  name
        self.imageURL =  "show.image.original" <~~ json
    }
}
