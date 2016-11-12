//
//  ShowListViewModel.swift
//  BoomerangDemo
//
//  Created by Stefano Mondino on 12/11/16.
//  Copyright © 2016 Stefano Mondino. All rights reserved.
//

import UIKit
import Boomerang

final class ShowItemViewModel : ItemViewModelType {
    var model: ItemViewModelType.Model
    var itemIdentifier: ListIdentifier = "ShowItemCollectionViewCell"
    var title:String!
    init(model:ModelType) {
        
        self.model = model
        guard let show = model as? Show else {
            return
        }
        
        self.title = show.title ?? ""
    }
}

final class ShowListViewModel: ListViewModel {
    required init() {}
    
    override func listIdentifiers() -> [ListIdentifier] {
        return ["ShowItemCollectionViewCell"]
    }
    
    override func itemViewModel(_ model: ModelType) -> ItemViewModelType? {
        return ShowItemViewModel(model: model)
    }
}
