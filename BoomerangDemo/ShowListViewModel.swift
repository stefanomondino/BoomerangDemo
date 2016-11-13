//
//  ShowListViewModel.swift
//  BoomerangDemo
//
//  Created by Stefano Mondino on 12/11/16.
//  Copyright © 2016 Stefano Mondino. All rights reserved.
//

import UIKit
import ReactiveSwift
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

final class ShowListViewModel: ListViewModelType {
    var dataHolder: ListDataHolderType = ListDataHolder.empty
    let queryString = MutableProperty<String>("")
    
    func select(selection: SelectionType) -> ViewModelType {
        return self
    }
    init() {
        self.dataHolder = ListDataHolder(dataProducer: self.queryString.producer.flatMap(.latest){
            return Show.query($0).map {array in ModelStructure(array)}
        })
    }
     func listIdentifiers() -> [ListIdentifier] {
        return ["ShowItemCollectionViewCell"]
    }
    
    func itemViewModel(_ model: ModelType) -> ItemViewModelType? {
        return ShowItemViewModel(model: model)
    }
}
