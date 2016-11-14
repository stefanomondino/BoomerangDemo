//
//  ShowItemViewModel.swift
//  BoomerangDemo
//
//  Created by Stefano Mondino on 14/11/16.
//  Copyright © 2016 Stefano Mondino. All rights reserved.
//

import Foundation
import ReactiveSwift
import Boomerang
import Result

class ShowItemViewModel : ItemViewModelType, ModelType {
    var model: ItemViewModelType.Model
    var itemIdentifier: ListIdentifier = View.showItem
    var title:String?
    var image:SignalProducer<UIImage,NoError>?
    required init(model:ModelType) {
        
        self.model = model
        guard let show = model as? Show else {
            return
        }
        
        self.title = show.title ?? ""
        self.image = show.image
    }
}
